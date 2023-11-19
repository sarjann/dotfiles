#!/bin/bash
set -e


function _general {
    sudo apt install git libsdl2-gfx-dev curl apt-transport-https \
        ca-certificates gnupg lsb-release build-essential zlib1g-dev \
        libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev \
        libffi-dev wget tmux liblzma-dev bzip2 sqlite libsqlite3-dev \
        libbz2-dev python-tk python3-tk python3-dotenv-cli tk-dev git-lfs jq -y
    sudo apt install apt-transport-https fuse libfuse fzf -y
    sudo apt install xclip ffmpeg ripgrep iperf net-tools -y
    sudo apt install postgresql redis rabbitmq-server cmake -y
    sudo apt install gimp pipx -y
    # For docks
    sudo apt install displaylink -y
}

function _docker {
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
        https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
        | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install docker-ce docker-ce-cli containerd.io -y
}

function _app_tools {
    sudo snap install dbeaver-ce
    sudo snap install postman
    sudo snap install slack --classic
    sudo snap install whatsapp-for-linux
    sudo snap install spotify
    sudo snap install code --classic
    sudo snap install vlc
    sudo snap install discord
    sudo snap install nvim --classic
    sudo snap install kubectl --classic
    sudo snap install obsidian --classic
}

function _regolith {
    wget -qO - https://regolith-desktop.org/regolith.key | \
    gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
    echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
        https://regolith-desktop.org/release-3_0-ubuntu-jammy-amd64 jammy main" | \
        sudo tee /etc/apt/sources.list.d/regolith.list

    sudo apt update -y
    sudo apt install regolith-desktop regolith-session-sway regolith-look-nord -y
    sudo apt install regolith-desktop regolith-session-flashback regolith-look-lascaille -y
}

function _neovim {
    sudo add-apt-repository ppa:neovim-ppa/unstable -y
    sudo apt install neovim -y
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
    mkdir -p ~/.config/nvim/pack/airblade/start
    cd ~/.config/nvim/pack/airblade/start
    git clone https://github.com/airblade/vim-gitgutter.git
}

function _yubikey {
    sudo add-apt-repository ppa:yubico/stable -y && sudo apt update -y

    sudo apt install yubioath-desktop -y
}

function _go {
    sudo snap install go --classic
    go install github.com/cosmtrek/air@latest
    go install github.com/rhysd/dotfiles@latest
    go install github.com/derailed/k9s@latest
}

function _rust {
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
    source ~/.bashrc
    rustup update
    cargo install cargo-watch
}

function _python {
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    cd ~/.pyenv && src/configure && make -C src
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
    source ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

    source ~/.bashrc
    git clone https://github.com/alefpereira/pyenv-pyright.git $(pyenv root)/plugins/pyenv-pyright
    source ~/.bashrc
    pyenv install 3.10.12

    curl -sSL https://install.python-poetry.org | python3 -
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

function _other_apps {
    # Signal
    wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
    cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
        sudo tee /etc/apt/sources.list.d/signal-xenial.list

    rm signal-desktop-keyring.gpg 2> /dev/null
    sudo apt update && sudo apt install signal-desktop
}

function _post_setup_services {
    sudo rabbitmq-plugins enable rabbitmq_management
}

#
function _thorium {
    wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
    sudo mv thorium.list /etc/apt/sources.list.d/
    sudo apt update -y
    sudo apt install thorium-browser -y
}

function _slackterm {
    go install github.com/erroneousboat/slack-term@latest
}

function _lutris {
    sudo dpkg --add-architecture i386 && sudo apt update && sudo apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
}

function _keyboard {
    xmodmap -e "remove mod1 = Alt_R"
}

function _dotnet {
    sudo apt update -y
    sudo apt upgrade dotnet-sdk-7.0 -y
}

function _helix {
    sudo add-apt-repository ppa:maveonair/helix-editor -y
    sudo apt update -y
    sudo apt install helix -y
}

function _lazy_git {
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
}

function _pipx {
    pipx install conan
}

function _brave {
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update -y
    sudo apt install brave-browser -y
}

function _warpd {
    (git clone https://github.com/rvaiya/warpd.git
    cd warpd
    sudo apt-get install \
        libxi-dev \
        libxinerama-dev \
        libxft-dev \
        libxfixes-dev \
        libxtst-dev \
        libx11-dev \
        libcairo2-dev \
        libxkbcommon-dev \
        libwayland-dev &&
        make && sudo make install)
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
_python
_node
_java
_ocaml
_other_apps
_keyboard
_dotnet
_lazy_git
_pipx
_brave
_post_setup_services
_warpd

