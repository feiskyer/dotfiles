# dotfiles

Vim related steps:

```sh
# install vim 8.0
sudo add-apt-repository ppa:jonathonf/vim && sudo apt-get update && sudo apt-get install vim -y

# setup vim-go
git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
vim +:GoInstallBinaries
```

## Files

.vim
    directory of file type configurations and plugins
.vimrc
    my vim configuration
.screenrc
    my screen configuration
.weechat
    my configuration for weechat, a great irc client
.gimp
    my tweaks/additions to gimp (fonts, brushes, etc)

## Instructions
### Creating source files
Any file which matches the shell glob `_*` will be linked into `$HOME` as a symlink with the first `_`  replaced with a `.`

For example:

    _bashrc

becomes

    ${HOME}/.bashrc

### Installing source files
It's as simple as running:

    ./install.sh zsh

From this top-level directory.

### Only install and build vim Files
Because this bit is pretty portable

    ./install.sh vim

### Restore old source Files
To replace installed files with the originals:

    ./install.sh restore

Note that if there was not an original version, the installed links will not be removed.

## Requirements
### Shell
* bash

### Vim
* python
  * pep8
  * pyflakes
  * rope
  * ruby
  * rake
