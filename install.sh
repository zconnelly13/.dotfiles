#!/bin/env bash
for dot in $(ls -A); do
	if [ ! $dot == "README.md" -a ! $dot == "install.sh" ]; then
		target="$HOME/$dot"
		ln -sf "$PWD/$dot" "$target"
	fi
done
git clone https://github.com/gmarik/vundle.git "$HOME/.vim/bundle/vundle" &> /dev/null
git config --global user.email "zconnelly13@gmail.com"
git config --global user.name "Zac Connelly"
vim +PluginInstall +qall
