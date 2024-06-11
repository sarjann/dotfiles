## Turso DB
curl -sSfL https://get.tur.so/install.sh | bash

## Morse
sudo apt-add-repository ppa:hmatuschek/ppa
sudo apt-get update
sudo apt-get install kochmorse -y

## Things like video codecs
sudo apt-get install ubuntu-restricted-extras -y

## Z Shell
sudo apt install zsh zoxide -y
# sudo apt install zsh-autosuggestions zsh-syntax-highlighting -y
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Starship
curl -sS https://starship.rs/install.sh | sh

## Portmaster
curl -fsSL https://updates.safing.io/latest/linux_all/packages/install.sh | sudo bash

## Mongo compass
wget https://downloads.mongodb.com/compass/mongodb-compass_1.40.4_amd64.deb
sudo dpkg -i mongodb-compass_1.40.4_amd64.deb

## ZSA
sudo apt install libusb-1.0-0-dev
