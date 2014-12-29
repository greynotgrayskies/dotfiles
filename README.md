i3
==

Source: http://blog.hugochinchilla.net/2013/03/using-gnome-3-with-i3-window-manager/

```
ln -s ~/dotfiles/i3-files ~/.i3
sudo ln -s ~/.i3/gnome-i3.desktop /usr/share/xsessions/gnome-i3.desktop
sudo ln -s ~/.i3/i3.session /usr/share/gnome-session/sessions/i3.session
```

Xmonad
======

Setting Up
----------
```
sudo apt-get install gnome-settings-daemon gnome-panel
sudo apt-get install xmonad
```

Other Notes:
------------

  - Gnome panel settings can be found in `org.gnome.gnome-panel.layout`
