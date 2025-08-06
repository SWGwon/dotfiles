sudo apt update
sudo apt upgrade -y
sudo apt install -y curl
sudo apt install -y dconf-cli
sudo apt install -y npm
sudo apt install -y vim
sudo apt install -y build-essential
sudo apt install -y git
sudo apt install -y cmake
sudo apt install -y libx11-dev libxpm-dev libxft-dev libxext-dev
sudo apt install -y libssl-dev
sudo apt install -y python3-dev
sudo apt install -y cmake-curses-gui
sudo apt install -y libxerces-c-dev
sudo apt install -y qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools
sudo apt install -y libxmu-dev libxmu-headers

git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./install.sh

cd ..
./setup.sh
