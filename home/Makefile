include home/.config/Makefile


#####################
## Primary Targets ##
#####################

TARGETS := bash-dotfiles i3-dotfiles git-dotfiles vim-dotfiles

.PHONY: all-dotfiles ${TARGETS}

all-dotfiles: ${TARGETS}

# TODO(jeffreylu): Move this elsewhere. This is more or less obsolete now since
# i3 doesn't read dconf settings. But it's still probably nice to have.
set-caps-config:
	@# Other options can be found in `man xkeyboard-config`
	@# Search for 'Caps Lock key behavior'
	@# Make Caps Lock an additional ESC
	dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"

bash-dotfiles: $(addprefix ${HOME}/, .bashrc .inputrc .profile)

i3-dotfiles: ${HOME}/.config/i3

git-dotfiles: ${HOME}/.gitconfig

vim-dotfiles: ${HOME}/.vim ${HOME}/.vimrc

# Ensure that bash prompt commands are loaded on bash startup.
${HOME}/.bashrc: ${HOME}/.bash_prompt
	if ! (grep -q '. ~/.bash_prompt' $@); then\
		echo '\n# Set prompt\n. ~/.bash_prompt' >> ${HOME}/.bashrc;\
	fi
	touch $@

# Implicit pattern rule for creating symlinks.
${HOME}/%: home/%
	if [ ! -e $@ ]; then\
		ln -s --target-directory=${@D} $(abspath $<);\
	fi
	touch $@

