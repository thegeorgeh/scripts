#!/bin/bash

os=$(cat /etc/os-release | grep -i ID_LIKE)
pManager=""

case $os in
    *"arch"*)
       arch_install;;
    *"debian"*)
	pManager="apt"
	deb_cent_install;;
    *"rhel fedora"*)
	pManager="yum"
	deb_cent_install;;
esac

arch_install() {

    sudo pacman -Syyu

    current_desktop=$(env | grep -i xdg_current_desktop)

    # gui applications
    if[[ "$current_desktop" != "" ]]
    then
	sudo pamac build spotify
    fi
    
    # clone down github repos
    git clone https://github.com/thegeorgeh/custom_emacs.git
    cp ~/custom_emacs/.emacs ~/
    git clone https://github.com/thegeorgeh/scripts.git ~/Documents/scripts
    git clone https://github.com/thegeorgeh/rust.git ~/Documents/rust
    
    # rust install
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
    source ~/.bash_profile
    # rustup toolchain add nightly
    cargo +nightly install racer

    # golang install
    # printf "export GOROOT=/usr/local/go\nexport GOPATH=~/Documents/Golang\nexport PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.bash_profile
    #
    #

    # terminal applications
    sudo pacman -S mc
    sudo pacman -S w3m
    sudo pacman -S emacs
    
}

deb_cent_install() {

    #sudo apt install build-essential
}

	
