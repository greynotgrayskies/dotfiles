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
	dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
	@echo 'Configured Caps Lock key'

#####
# TARGET: gnome-panel-config
# gnome-panel configuration
#
# gnome-panel has a both a top panel and a bottom panel. You can configure
# which panels to keep as well as which panel elements to show.
#
# There might be a way to choose where each panel element appears, but since I
# only want keep the top panel, I'm not particularly motivated to find out how.
#
# To find the list of possible panel elements to add to the gnome-panel, you
# can find them with:
# 	`dconf list /org/gnome/gnome-panel/layout/objects/`
# 
# You can also have more than just these two panels, but why?

# TODO: Shouldn't need to edit Makefile for this. Move this elsewhere.

# Panel Elements
GNOME_PANEL_OBJS += menu-bar-0
GNOME_PANEL_OBJS += indicators-0
#GNOME_PANEL_OBJS += show-desktop-0
#GNOME_PANEL_OBJS += window-list-0
#GNOME_PANEL_OBJS += workspace-switcher-0

# Panels
GNOME_PANELS += top-panel-0
#GNOME_PANELS += bottom-panel-0

gnome-panel-config: OBJS = $(call dconf_list,${GNOME_PANEL_OBJS})
gnome-panel-config: PANELS = $(call dconf_list,${GNOME_PANELS})
gnome-panel-config:
	@echo dconf write ${GNOME_PANEL_OBJECT_ID_LIST} \"${OBJS}\"
	@dconf write ${GNOME_PANEL_OBJECT_ID_LIST} "${OBJS}"
	@echo dconf write ${GNOME_PANEL_TOPLEVEL_ID_LIST} \"${PANELS}\"
	@dconf write ${GNOME_PANEL_TOPLEVEL_ID_LIST} "${PANELS}"

	# TODO: This should be generalized to gnome-config rather than just the
	# panel.
	dconf write /org/gnome/desktop/background/show-desktop-icons false


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

${HOME}/.xmonad: xmonad
	sudo apt-get install xmonad
	sudo apt-get install gnome-panel
	ln -s ${abspath $<} $@
	xmonad --recompile

${HOME}/.bash_prompt: bash_prompt
	ln -s ${abspath $<} $@

${HOME}/.inputrc: inputrc
	ln -s ${abspath $<} $@

bashrc:
	@# Need to double check whether or not this adds a random '-e' in .bashrc
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

