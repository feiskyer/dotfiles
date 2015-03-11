#!/usr/bin/env bash
function link_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}" ] && [ ! -L "${target}" ]; then
        mv $target $target.df.bak
    fi

    ln -sf ${source} ${target}
}

function unlink_file {
    source="${PWD}/$1"
    target="${HOME}/${1/_/.}"

    if [ -e "${target}.df.bak" ] && [ -L "${target}" ]; then
        unlink ${target}
        mv $target.df.bak $target
    fi
}

if [ "$1" = "vim" ]; then
    for i in _vim*
    do
       link_file $i
    done
elif [ "$1" = "zsh" ]; then
    cat /etc/issue | grep Ubuntu && sudo apt-get install zsh || sudo yum -y install zsh
    chsh -s /bin/zsh
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    sudo apt-get install -y awesome awesome-extra gnome-settings-daemon nautilus
    sudo apt-get install -y --no-install-recommends gnome-session
    mkdir -p ~/.config/awesome
    ln -sf ${PWD}/_rc.lua ~/.config/awesome/rc.lua
    # git clone git://github.com/mikar/awesome-themes.git ~/.config/awesome/themes
    sudo apt-get install -y chromium-browser
elif [ "$1" = "term" ]; then
    sudo apt-get -y install terminator
    mkdir -p ~/.config/terminator/
    ln -sf ${PWD}/_terminator/config ~/.config/terminator/config
    ln -sf ${PWD}/_terminator/dircolors.ansi-dark ~/.dircolors
elif [ "$1" = "restore" ]; then
    for i in _*
    do
        unlink_file $i
    done
    exit
else
    for i in _*
    do
        link_file $i
    done
fi

git submodule update --init --recursive
git submodule foreach --recursive git pull origin master

setup command-t
cd _vim/bundle/command-t
rake make
