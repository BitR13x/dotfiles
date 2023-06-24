#!/bin/bash


echo "Updating linux[*]:"
sudo apt-get update -y && sudo apt-get full-upgrade -y #&& sudo apt-get dist-upgrade -y

PhoneInfoga() {
   echo "Installing PhoneInfoga[*]:"
   curl -sSL https://raw.githubusercontent.com/sundowndev/PhoneInfoga/master/support/scripts/install | bash
   sudo mv ./phoneinfoga /usr/bin/phoneinfoga
}

while true; do
   read -p "Install snap? [Y/N] `echo $'\n> '` " snapInstall
      case $snapInstall in
         [Yy]* ) break;;
         [Nn]* ) break;;
         * ) echo "Please answer yes or no. \n ";;
   esac
done



echo "Unziping wordlists[*]:"
sleep 0.1
sudo gunzip /usr/share/wordlists/rockyou.txt.gz
sudo mv /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt /usr/share/wordlists/directory-list-2.3-medium.txt

echo "Installing [git meld gitg zaproxy ltrace armitage gobuster stegcracker steghide hexedit binwalk html2text sshfs gau gedit] with apt[*]:"
sleep 0.1
sudo apt install git -y
sudo apt install meld -y
sudo apt install gitg -y

sudo apt install zaproxy ltrace armitage gedit \
 gobuster stegcracker steghide hexedit binwalk html2text sshfs gau -y

pip3 install stegoveritas
pip3 install spotify-dl
pip3 install youtube-dl



if [[ $snapInstall = [Yy]* ]]; then
   echo "Installing snap[*]:"
   sleep 0.1
   sudo apt install snap -y
   sudo apt --fix-broken install -y
   sudo apt install Snap -y
   sudo apt install snapd -y
   sudo systemctl start snapd
   sudo systemctl enable snapd
   systemctl start apparmor
   systemctl enable apparmor
fi

# Cutter
# https://github.com/rizinorg/cutter/releases/
echo "Installing cutter"
mkdir ~/Apps
wget https://github.com/rizinorg/cutter/releases/download/v2.2.1/Cutter-v2.2.1-Linux-x86_64.AppImage -P ~/Apps
chmod +x ~/Apps/Cutter-v2.2.1-Linux-x86_64.AppImage

# Obsidian
# https://obsidian.md/download
echo "Installing obsidian"
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.5/Obsidian-1.3.5.AppImage -P ~/Apps
chmod +x ~/Apps/Obsidian-1.3.5.AppImage

# Pomotroid
# wget https://github.com/Splode/pomotroid/releases/download/v0.13.0/pomotroid-0.13.0-linux.AppImage -P ~/Apps
# alias pomotroid="~/Apps/pomotroid-0.13.0-linux.AppImage --disable-gpu-sandbox"
while true; do
   read -p "Install docker? [Y/N] `echo $'\n> '` " dockerInstall
      case $dockerInstall in
         [Yy]* ) break;;
         [Nn]* ) break;;
         * ) echo "Please answer yes or no. \n ";;
   esac
done


if [[ $dockerInstall = [Yy]* ]]; then
   sudo apt install curl gnupg2 apt-transport-https software-properties-common ca-certificates
   #[ -f /var/run/reboot-required ] && sudo reboot -f
   curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
   echo "deb [arch=amd64] https://download.docker.com/linux/debian bullseye stable" | sudo tee  /etc/apt/sources.list.d/docker.list
   sudo apt update
   sudo apt install docker-ce docker-ce-cli containerd.io
fi

while true; do
   read -p "Install nodejs? [Y/N] `echo $'\n> '` " nodeInstall
      case $nodeInstall in
         [Yy]* ) break;;
         [Nn]* ) break;;
         * ) echo "Please answer yes or no. \n ";;
   esac
done

if [[ $nodeInstall = [Yy]* ]]; then
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
   zsh -c "nvm install node"
fi
