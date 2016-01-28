.PHONY: set-bashprompt set-keybindings set-vim set-xmonad bashrc

set-bashprompt: ${HOME}/.bash_prompt bashrc
	@echo 'Configured bash prompt settings'

set-keybindings: ${HOME}/.Xmodmap
	@echo 'Configured keybindings. A restart may be required for changes to take into effect.'

set-vim: ${HOME}/.vim ${HOME}/.vimrc
	@echo 'Configured vim settings.'

set-xmonad: ${HOME}/.xmonad
	@echo 'Configured XMonad. A restart may be required for changes to take into effect.'

${HOME}/.vim: vim
	ln -s ${abspath $<} $@

${HOME}/.vimrc: vimrc
	ln -s ${abspath $<} $@
	
${HOME}/.Xmodmap: Xmodmap
	ln -s ${abspath $<} $@

# This may or may not work. Need to test it out.
${HOME}/.xmonad: xmonad
	sudo apt-get install xmonad
	sudo apt-get install gnome-panel
	sudo apt-get install suckless-tools
	ln -s ${abspath $<} $@
	xmonad --recompile

${HOME}/.bash_prompt: bash_prompt
	ln -s ${abspath $<} $@

bashrc:
	if ! (grep -q '. ~/.bash_prompt' ~/.bashrc); then\
		echo -e '\n# Set prompt\n. ~/.bash_prompt' >> ${HOME}/.bashrc;\
	fi
