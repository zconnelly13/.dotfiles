dotfiles
========

###How to Use

If you'd like to grab everything, clone this repo into your home directory

```
cd ~
git clone https://github.com/zconnelly13/dotfiles
```

Else if you'd like to pick and choose, see ```.bashrc``` and ```.vimrc```

Everything should be pretty straightforward except for perhaps the [vundles](https://github.com/gmarik/Vundle.vim) in my vimrc that look like
```
Plugin 'githubUserName/repo'
```
This, however, is where a lot of the magic happens.

All of the directories in ```.vim/bundles/``` are empty because they are populated with vundle.

###Salt

Everything in this repo is managed with salt [here](https://github.com/zconnelly13/salt)
