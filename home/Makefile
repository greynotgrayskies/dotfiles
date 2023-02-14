#####################
## Primary Targets ##
#####################

BASH_SYMLINK_TARGETS = .bash_prompt .inputrc .profile
GIT_SYMLINK_TARGETS = .gitconfig
I3_SYMLINK_TARGETS = .config/i3 .config/i3status
VIM_SYMLINK_TARGETS = .vim .vimrc

# TODO(jeffreylu): Move this elsewhere. This is more or less obsolete now since
# i3 doesn't read dconf settings. But it's still probably nice to have.
set-caps-config:
	@# Other options can be found in `man xkeyboard-config`
	@# Search for 'Caps Lock key behavior'
	@# Make Caps Lock an additional ESC
	dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

.PHONY: all bash-dotfiles i3-dotfiles git-dotfiles vim-dotfiles

all: bash-dotfiles i3-dotfiles git-dotfiles vim-dotfiles

bash-dotfiles: $(addprefix ${HOME}/, ${BASH_SYMLINK_TARGETS})
	# Ensure that bash prompt commands are loaded on bash startup.
	if ! (grep -q '. ~/.bash_prompt' ~/.bashrc); then\
		echo '\n# Set prompt\n. ~/.bash_prompt' >> ${HOME}/.bashrc;\
	fi

i3-dotfiles: $(addprefix ${HOME}/, ${I3_SYMLINK_TARGETS})
	# Install i3
	sudo apt-get install i3

git-dotfiles: $(addprefix ${HOME}/, ${GIT_SYMLINK_TARGETS})
	# Install git, which may not come preinstalled, nor be installed prior to
	# setting up dotfiles. How I would've cloned this repo is a mystery.
	sudo apt-get install git

vim-dotfiles: $(addprefix ${HOME}/, ${VIM_SYMLINK_TARGETS})
	# Install vim, which may not come preinstalled, nor be installed prior to
	# setting up dotfiles.
	sudo apt-get install vim

###########################
## Symlink Pattern Rules ##
###########################

# Implicit pattern rules for creating symlinks.

# Most files and directories can be linked directly.
${HOME}/.%: .%
	ln -s ${abspath $<} $@

# An exception is .config, which should not replace ~/.config, but instead
# create symlinks for each file/directory within it.
${HOME}/.config: $(addprefix ${HOME}/, $(wildcard .config/*))

${HOME}/.config/%: .config/%
	ln -s ${abspath $<} $@


