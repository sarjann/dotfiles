#!/bin/bash
set -e


function _general {
    sudo apt install git, libsdl2-gfx-dev, curl, apt-transport-https \
        ca-certificates, gnupg, lsb-release -y
}

function _docker {
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
}

function _app_tools {
    sudo snap install dbeaver-ce
    sudo snap install postman
    sudo snap install slack --classic
    sudo snap install whatsapp-for-linux
    sudo snap install spotify
    sudo snap install code --classic
    sudo snap install vlc
}

function _regolith {
    wget -qO - https://regolith-desktop.org/regolith.key | \
    gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
    echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
        https://regolith-desktop.org/release-3_0-ubuntu-jammy-amd64 jammy main" | \
        sudo tee /etc/apt/sources.list.d/regolith.list

    sudo apt install regolith-desktop regolith-session-sway regolith-look-nord -y
    sudo apt update -y
    sudo apt install regolith-desktop regolith-session-flashback regolith-look-lascaille -y
}

function _neovim {
    sudo apt install neovim -y
}

function _yubikey {
    sudo add-apt-repository ppa:yubico/stable -y && sudo apt update -y

    sudo apt install yubioath-desktop -y
}

function _go {
    sudo apt install golang-go -y
}

function _rust {
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
    rustup update
}

function _pyenv {
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    cd ~/.pyenv && src/configure && make -C src
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc

    source ~/.bashrc
    git clone https://github.com/alefpereira/pyenv-pyright.git $(pyenv root)/plugins/pyenv-pyright
    pyenv install 3.10.12
}

function _node {
    sudo apt install npm -y
    sudo npm install -g n
    sudo n stable
    curl -fsSL https://bun.sh/install | bash
}

function _java {
    sudo apt install default-jre -y
    sudo apt install openjdk-11-jre-headless -y
    sudo apt install openjdk-8-jre-headless -y
    sudo apt install default-jre -y
}


function _ocaml {
    sudo apt install opam -y
    opam init
    eval $(opam env)
    eval $(opam env --switch=default)
}

sudo apt update

_general
_docker
_app_tools
_regolith
_neovim
_yubikey
_go
_rust
_pyenv
_node
_java
_ocaml
