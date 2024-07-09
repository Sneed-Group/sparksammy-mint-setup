cd ~

sudo dpkg --add-architecture i386 

sudo apt remove -y celluloid hypnotix thunderbird firefox libreoffice* hexchat rhythmbox transmission

sudo mkdir -pm755 /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key

sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources

sudo apt update


## Apt install some stuff
sudo apt install --install-recommends winehq-devel
sudo apt install clamav python3 python3-pip wget curl git cron clamav-freshclam
sudo systemctl enable --now cron

#Install NVM and Ollama
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc

nvm install --lts
nvm use --lts

# Install flatpaks
flatpak install librewolf shotcut ferdium geforce krita libreoffice freetube spotify com.stremio.Stremio vscodium vinegar com.obsproject.Studio bottles localsend steam heroic discord vlc


## Setup scripts/SneedScan, finish up.
cd /usr/bin

sudo wget https://github.com/Sneed-Group/roblox-scrcpy/releases/download/scrcpy/scrcpy.AppImage
sudo chmod +x /usr/bin/scrcpy.AppImage

sudo wget https://github.com/Sneed-Group/SneedScan/raw/main/sneedscan.sh
sudo chmod +x sneedscan.sh

sudo wget https://github.com/Sneed-Group/roblox-scrcpy/raw/main/roblox-scrcpy.sh
sudo chmod +x /usr/bin/roblox-scrcpy.sh

sudo wget https://raw.githubusercontent.com/Sneed-Group/roblox-scrcpy/main/roblox-scrcpy-orset.sh
sudo chmod +x /usr/bin/roblox-scrcpy-orset.sh

cd ~

sudo crontab -l > scancron
sudo echo "0 */6 * * * sneedscan.sh &" >> scancron
sudo crontab scancron
sudo rm scancron
echo "Done! SneedScan will now run every 6 hours. :-)"

clear
echo Done!
