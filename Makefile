include etc/Makefile
include home/Makefile

BIN = /usr/bin

TARGETS := bash i3 git vim

all: ${TARGETS}

bash: bash-dotfiles

i3: i3-dotfiles ${BIN}/i3

git: git-dotfiles ${BIN}/git

vim: vim-dotfiles ${BIN}/vim

# Implicit pattern rule for installing missing binaries.
${BIN}/%:
	sudo apt-get install ${@F}

