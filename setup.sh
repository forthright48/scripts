#!/bin/sh

# A shell script to install softwares automatically
# Run the script as root by typing: sudo sh setup.sh

# 0. First go to home
cd ~

# 1. First update and upgrade
apt-get update -y
apt-get upgrade -y

# 2. Install Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb
apt-get install -f # For dependencies
rm google-chrome*.deb

# 3. Bangla Fonts
mkdir -p .fonts # -p in case .fonts is already there
cd .fonts
wget files.ekushey.org/Ekushey_OpenType_Bangla_Fonts/SolaimanLipi_Bold_10-03-12.ttf
fc-cache -f -v
cd ~

# 4. Install Atom
add-apt-repository ppa:webupd8team/atom
apt-get update -y
apt-get install atom -y

# Now install all required packages
apm install atom-beautify hightlight-selected linter linter-csslint linter-eslint linter-flake8 markdown-preview-plus minimap pigments todo-show linter-pug filesize

# 5. Install Java-8
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-set-default -y

# 6. Install other useful packages
apt-get install -y git vim npm

# 7. Install NodeJS
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

# Install some essential node packages
npm install -g nodemon

# 8. Install restricted extras (for mp3 and stuff)
apt-get install ubuntu-restricted-extras


# Last Step
apt-get autoremove
