#!/bin/bash

os=$(cat /etc/os-release | grep -i ID_LIKE)

personal_linux_install() {    

    if [[ "$current_desktop" != "" ]];
    then
	git clone --recurse-submodules https://github.com/flightlessmango/MangoHud.git
	~/MangoHud/build.sh build
	~/MangoHud/build.sh package
	~/MangoHud/build.sh install
    fi

    # clone down github repos
    git clone https://github.com/thegeorgeh/scripts.git ~/Documents/scripts
    git clone https://github.com/thegeorgeh/rust.git ~/Documents/rust
    
    # rust install
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
    source ~/.bash_profile
    # rustup toolchain add nightly
    cargo +nightly install racer

    # golang install
    wget https://dl.google.com/go/go1.14.1.linux-amd64.tar.gz
    tar xvzf go1.14.1.linux-amd64.tar.gz -C ~/usr/local/
    printf "export GOROOT=/usr/local/go\nexport GOPATH=~/Documents/Golang\nexport PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH" >> ~/.bash_profile
    source ~/.bash_profile
    go get -u github.com/mdempsky/gocode
    go get golang.org/x/tools/cmd/goimports

}


arch_install() {
  
    sudo pacman -Syyu

    current_desktop=$(env | grep -i xdg_current_desktop)

    # gui applications
    if [[ "$current_desktop" != "" ]];
    then
	pamac build spotify
	sudo pacman -S discord
    fi
	
    # terminal applications
    sudo pacman -S mc
    sudo pacman -S w3m && sudo pacman -S w3m-img
    sudo pacman -S emacs
    pamac build powershell
    
    personal_linux_install()

    source ~/.bash_profile
}

deb_install() {

    sudo apt-get update && sudo apt-get upgrade
    sudo apt install build-essential
    sudo apt-get git

    if [[ "$current_desktop" != "" ]];
    then
	sudo apt-get install spotify-client
	wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
	sudo dpkg -i ~/discord.deb
    fi

    sudo apt install mc
    sudo apt-get install w3m && sudo apt-get install w3m-img
    sudo apt-get install powershell

    personal_linux_install()

    source ~/.profile
}

rhel_cent_install() {

    sudo yum update && sudo yum upgrade
    sudo yum install emacs
    
}

opensuse_install() {
    sudo zypper update && sudo zypper dup
    sudo zypper install git
    sudo zypper install emacs
}
	
case $os in
    *"arch"*)
       arch_install;;
    *"debian"*)
	deb_install;;
    *"rhel fedora"*)
	rhel_cent_install;;
    *"opensuse suse"*)
	opensuse_install;;
esac

    # clone down github repos
    git clone https://github.com/thegeorgeh/custom_emacs.git
    cp ~/custom_emacs/.emacs ~/

    emacs --funcall package-install-selected-packages -nw

