# TODO: Clean up Makefile.

#####################
## Primary Targets ##
#####################

set-bashprompt: ${HOME}/.bash_prompt bashrc
	@echo 'Configured bash prompt settings'

set-caps-config:
	@# Other options can be found in `man xkeyboard-config`
	@# Search for 'Caps Lock key behavior'

	@# Make Caps Lock an additional ESC
	@# The former doesn't work in i3.  I don't know if we even need the former.
	dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
	setxkbmap -option caps:escape
	@echo 'Configured Caps Lock key'

set-git: ${HOME}/.gitconfig
	@echo 'Configured git settings'


set-vim: ${HOME}/.vim ${HOME}/.vimrc
	@echo 'Configured vim settings.'


set-xmonad: ${HOME}/.xmonad gnome-panel-config
	@echo 'Configured XMonad. A restart may be required for changes to take into effect.'

.PHONY: set-bashprompt set-keybindings set-vim set-xmonad bashrc

###################
## Other Targets ##
###################

${HOME}/.gitconfig: gitconfig
	ln -s ${abspath $<} $@

${HOME}/.vim: vim
	ln -s ${abspath $<} $@

${HOME}/.vimrc: vimrc
	ln -s ${abspath $<} $@
	
${HOME}/.Xmodmap: Xmodmap
	ln -s ${abspath $<} $@

${HOME}/.bash_prompt: bash_prompt
	ln -s ${abspath $<} $@

${HOME}/.inputrc: inputrc
	ln -s ${abspath $<} $@

bashrc:
	@# Need to double check whether or not this adds a random '-e' in .bashrc
	@# Yes. It does.
	if ! (grep -q '. ~/.bash_prompt' ~/.bashrc); then\
		echo -e '\n# Set prompt\n. ~/.bash_prompt' >> ${HOME}/.bashrc;\
	fi


######################
## Helper Functions ##
######################

# Convert list to a dconf list of strings.
dconf_list = `echo ${1} | sed "s/ \+/', '/g" | sed "s/\(.\+\)/'\1'/" | sed "s/\(.*\)/[\1]/"`


###############
## Constants ##
###############

GNOME_PANEL_OBJECT_ID_LIST = /org/gnome/gnome-panel/layout/object-id-list
GNOME_PANEL_TOPLEVEL_ID_LIST = /org/gnome/gnome-panel/layout/toplevel-id-list


