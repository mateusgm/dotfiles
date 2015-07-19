
BASE=/media/arquivos
DOTFILES=~/tools/dotfiles

# cleaning

for dir in `ls ~/`; do
  rm ~/$dir
done

# folders 

for dir in `ls $BASE | grep -v 'configs'`; do
  ln -sf $BASE/$dir ~/$dir
done

# configs

for config in `ls $BASE/configs`; do
  ln -sf $BASE/configs/$config ~/.$config
done

# desktop


ln -sf ~/projects ~/desktop




