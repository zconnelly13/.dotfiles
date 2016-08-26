#!/bin/env bash
for dot in $(ls -A); do
	if [ ! $dot == "README.md" -a ! $dot == "install.sh" ]; then
		target="$HOME/$dot"
		ln -sf "$PWD/$dot" "$target"
	fi
done

# uncomment below to include pingme (must be on vpn)
# git clone git@github.counsyl.com:zac/ping_me.git ~/ &> /dev/null

# Install and configure Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim &> /dev/null
vim +PluginInstall +qall

# Install selecta
curl -s https://raw.githubusercontent.com/garybernhardt/selecta/master/selecta > $HOME/.bin/selecta
chmod +x $HOME/.bin/selecta

# Make sure .viminfo is owned by you
chown zac $HOME/.viminfo

# Global Git Config
git config --global core.excludesfile '~/.gitignore'

# Uncomment the appropriate lines

git config --global user.email "zac@counsyl.com"
# git config --global user.email "zconnelly13@gmail.com"

git config --global user.name "Zac Connelly"
