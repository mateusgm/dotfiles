#!/usr/bin/env bash

# link all files from the dotfiles repo in $HOME, iff non existant, or
# non-changed

# top dir of our dotfiles

topdir=$(dirname `realpath ${BASH_SOURCE[0]}`);

dstdir=$(dirname $topdir)/dotfiles/.codex/prompts
srcdir=$(dirname $topdir)/dotfiles/.claude/commands

echo "linking files from ${topdir}"
# better safe than sorry
[[ -d ${topdir} ]] || exit 1

# links files, never does directories, bails out if so
# dst should point into ${HOME}/...
maybe_link() {
	local src=$1
	local dst=$2

	[[ -n ${src} && -n ${dst} ]] || return 1
	[[ -d ${src} ]] && return 1

	if [[ -e ${dst} && -z ${FORCE} ]] ; then
		# don't deal with anything but files
		[[ -f ${dst} ]] || { echo "${dst} is not a file"; return 0; }
		# and don't touch symlinked files, even if they don't point to us
		[[ -L ${dst} ]] && { echo "leaving symlink ${dst} alone"; return 0; }
		# compare if this file is an unmodified .skel copy, else just
		# relink with what we're given
		if [[ -e /etc/skel/${dst#${HOME}} ]] \
			&& cmp -s "/etc/skel/${dst#${HOME}}" "${dst}" ;
		then
			: this file is identical to skel, overwrite it below
		else
			echo "leaving local (modified) file ${dst} alone"
			return 0
		fi
	fi
	if [[ -e ${dst} && -n ${FORCE} ]]; then
		# preserve the file/thing we'd otherwise destroy
		local bucketf=${dst//\//_}.$(date "+%FT%T" -r "${dst}")
		mv "${dst}" "${srcdir%/*}"/bit-bucket/${bucketf}
		echo "moved ${dst} to ${bucketf}"
	fi

	# create necessary dirs, and preserve permissions like the original
	local bdir=${dst%/*}; bdir=${bdir#${HOME}}
	local sdir=${src%${bdir}/${dst##*/}}
	local mdir=${HOME} d=
	for d in ${bdir//\// } ; do
		mdir+=/${d}
		sdir+=/${d}
		# we already checked above these are all dirs, or symlinks to
		# those, so we can expect to be able to enter them
		[[ -e ${mdir} ]] && continue
		mkdir "${mdir}" || return 1
		echo "created ${mdir}"
	done

	# yay, we can finally link ;)
	ln -sf "${src}" "${dst}"
	echo "symlinked ${src} to ${dst}"
}

# we only symlink files, never directories, this is to make sure our
# files are only an overlay of what the user has in use
# skip .{git,svn,hg,bzr} dirs because it's no good to copy their contents
find "${srcdir}" \
	\( -name .git -a -type d -prune \) -o \
	\( -name .svn -a -type d -prune \) -o \
	\( -name .hg -a -type d -prune \) -o \
	\( -name .bzr -a -type d -prune \) -o \
	-type f -print -o -type l -print | \
while read f ; do
	maybe_link ${f} ${dstdir}/${f#${srcdir}/}
done

