sudo apt-get install -y wmctrl

     # `gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-#{k} "['']"`
     #  `gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "#{already_created.uniq.to_s.gsub('"', "'")}"`
     #  `gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-#{k}/ binding "<Primary><Alt>#{k.capitalize}"`
     #  `gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-#{k}/ name "Uou Workspace #{k}"`
     #  `gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom-#{k}/ command "ws move #{k}"`
