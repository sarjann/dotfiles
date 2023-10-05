sudo apt-get update


sudo apt-get install git
# Regolith

wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null

echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-3_0-ubuntu-jammy-amd64 jammy main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

sudo apt install regolith-desktop regolith-session-sway regolith-look-nord
sudo apt update
sudo apt install regolith-desktop regolith-session-flashback regolith-look-lascaille

# Neovim
sudo apt-get install neovim

