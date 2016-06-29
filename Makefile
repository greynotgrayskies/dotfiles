.PHONY: set-bashprompt set-keybindings set-vim set-xmonad bashrc

# TODO(Jeffrey): Clean up Makefile.
set-bashprompt: ${HOME}/.bash_prompt bashrc
	@echo 'Configured bash prompt settings'

set-caps-config:
	@# Other options can be found in `man xkeyboard-config`
	@# Search for 'Caps Lock key behavior'

	@# Make Caps Lock an additional ESC
	dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
	@echo 'Configured Caps Lock key'

set-git:
	@echo 'Configured git settings'

set-vim: ${HOME}/.vim ${HOME}/.vimrc
	@echo 'Configured vim settings.'

set-xmonad: ${HOME}/.xmonad
	@echo 'Configured XMonad. A restart may be required for changes to take into effect.'

${HOME}/.gitconfig:
	ln -s ${abspath $<} $@
${HOME}/.vim: vim
	ln -s ${abspath $<} $@

${HOME}/.vimrc: vimrc
	ln -s ${abspath $<} $@
	
${HOME}/.Xmodmap: Xmodmap
	ln -s ${abspath $<} $@

${HOME}/.xmonad: xmonad
	sudo apt-get install xmonad
	sudo apt-get install gnome-panel
	# Do I need this one? I don't think so...
	#sudo apt-get install suckless-tools
	ln -s ${abspath $<} $@
	xmonad --recompile

${HOME}/.bash_prompt: bash_prompt
	ln -s ${abspath $<} $@

bashrc:
	@# Need to double check whether or not this adds a random '-e' in .bashrc
	if ! (grep -q '. ~/.bash_prompt' ~/.bashrc); then\
		echo -e '\n# Set prompt\n. ~/.bash_prompt' >> ${HOME}/.bashrc;\
	fi
