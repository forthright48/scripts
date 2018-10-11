#!/bin/sh

# A shell script to install softwares automatically
# Run the script as root by typing: sudo sh setup.sh

# 0. First go to home
cd ~

# 1. First update and upgrade
apt update -y
apt upgrade -y

# 2. Install Chrome
mkdir tmp
cd ~/tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb
apt install -yf # For dependencies
dpkg -i google-chrome*.deb # Try again
apt install -yf # Just in case
cd ~

# 3. Bangla Fonts
# mkdir -p .fonts # -p in case .fonts is already there
# cd .fonts
# wget files.ekushey.org/Ekushey_OpenType_Bangla_Fonts/SolaimanLipi_Bold_10-03-12.ttf
# fc-cache -f -v
# cd ~
# chown -R forthright48:forthright48 ./.fonts

# 4. Install Atom
add-apt-repository -y ppa:webupd8team/atom
apt update -y
apt install atom -y
# since the script is running in sudo, need to change it back to user
chown -R forthright48:forthright48 .atom

# Now install all required packages
apm install -y atom-beautify highlight-selected linter linter-csslint linter-eslint linter-flake8 markdown-preview-enhanced minimap todo-show linter-pug docblockr

# 5. Python
apt install -y python3-flake8 ipython3-notebook idle3 python3-pip libpng-dev libfreetype6-dev flake8
# su - forthright48 -c "pip3 install --user numpy pandas matplotlib requests"

# 6. Install other useful packages
apt install -y git vim curl geany htop cowsay kdiff3 mongodb-server

# Stop mongodb from running on startup
update-rc.d mongodb disable

# 7. Install NodeJS
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
apt update -y
apt install -y nodejs

# Fix npm permission
su - forthright48 -c "mkdir ~/.npm-global"
su - forthright48 -c "npm config set prefix '~/.npm-global'"  #Don't forget to update path

# Install some essential node packages
su - forthright48 -c "npm install npm@latest -g"
su - forthright48 -c "npm install -g nodemon gulpjs/gulp-cli"

# 8. Install proprietary softwares
apt install -y ubuntu-restricted-extras # for mp3 and stuff
apt install -y exfat-fuse exfat-utils # to mount exfat file system

# 9. Installing ibus-avro on Ubuntu 14.04
# add-apt-repository -y "deb http://download.opensuse.org/repositories/home:/sarimkhan/xUbuntu_14.04/ ./"
# wget -q http://download.opensuse.org/repositories/home:/sarimkhan/xUbuntu_14.04/Release.key -O- | apt-key add -
# apt update -y
# apt install -y ibus-avro-trusty

# 11. Git Configure
git config --global user.email "forthright48@gmail.com"
git config --global user.name "Mohammad Samiul Islam"
git config --global diff.tool kdiff3
git config --global merge.tool kdiff3
git config --global core.editor "vim"

# 12. Install docker
apt install apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt install docker-ce
adduser forthright48 docker

# Before End. Install Java-8
add-apt-repository ppa:webupd8team/java
apt update -y
apt install oracle-java8-set-default -y

# Last Step
apt autoremove

