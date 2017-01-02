#!/bin/sh

# A shell script to install softwares automatically
# Run the script as root by typing: sudo sh setup.sh

# 0. First go to home
cd ~

# 1. First update and upgrade
apt-get update -y
apt-get upgrade -y

# 2. Install Chrome
cd ~/tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb
apt-get install -yf # For dependencies
dpkg -i google-chrome*.deb # Try again
apt-get install -yf # Just in case
cd ~

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
# since the script is running in sudo, need to change it back to user
chown -R forthright48:forthright48 .atom

# Now install all required packages
apm install -y atom-beautify highlight-selected linter linter-csslint linter-eslint linter-flake8 markdown-preview-plus minimap pigments todo-show linter-pug filesize language-scala

# 5. Install Java-8
add-apt-repository ppa:webupd8team/java
apt-get update -y
apt-get install oracle-java8-set-default -y

# 5. Python
apt-get install -y python3-flake8 ipython3-notebook idle3 python3-pip
su - forthright48 -c "pip3 install --user numpy pandas"

# 6. Install other useful packages
apt-get install -y git vim npm curl geany htop cowsay

# 7. Install NodeJS
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get update -y
apt-get install -y nodejs

# Install some essential node packages
npm install -gy nodemon

# 8. Install restricted extras (for mp3 and stuff)
apt-get install -y ubuntu-restricted-extras

# 9. Installing ibus-avro on Ubuntu 14.04
add-apt-repository "deb http://download.opensuse.org/repositories/home:/sarimkhan/xUbuntu_14.04/ ./"
wget -q http://download.opensuse.org/repositories/home:/sarimkhan/xUbuntu_14.04/Release.key -O- | apt-key add -
apt-get update -y
apt-get install -y ibus-avro-trusty

# 10. Install sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
apt-get update -y
apt-get install -y sbt

# Before End. Install Java-8
add-apt-repository ppa:webupd8team/java
apt-get update -y
apt-get install oracle-java8-set-default -y

# Last Step
apt-get autoremove
