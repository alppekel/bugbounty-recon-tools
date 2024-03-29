#!/bin/bash

#####################################################################

# #

# Tested on Debian 11.02-amd64 #

# #

#####################################################################


echo "Installing required packages"

apt-get update -y
apt-get upgrade -y
apt-get install python3 git wget snapd python3-pip make gcc unzip -y
snap install core

echo "Creating 'tools' folder on working directory"

mkdir ~/tools

echo "Installing golang"

cd ~/tools
wget https://go.dev/dl/go1.19.5.linux-amd64.tar.gz
tar -zxvf go1.19.5.linux-amd64.tar.gz -C /usr/local/
ln -s /usr/local/go/bin/go /usr/bin

echo "Installing Amass"

snap install amass
ln -s /snap/bin/amass /usr/local/bin

echo "***** Installing tools for Finding Subdomains *****"

echo "Installing ctfr"

cd ~/tools
git clone https://github.com/UnaPibaGeek/ctfr.git
cd ctfr/
pip3 install -r requirements.txt

echo "Install assetfinder"

cd ~/tools
wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.1/assetfinder-linux-amd64-0.1.1.tgz
tar xzvf assetfinder-linux-amd64-0.1.1.tgz

echo "Install subfinder"

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
ln -s /root/go/bin/subfinder /usr/local/bin

echo "Installing github-subdomains"

go install github.com/gwen001/github-subdomains@latest
ln -s /root/go/bin/github-subdomains /usr/local/bin

echo "Installing subdomainizer"

cd ~/tools
git clone https://github.com/nsonaniya2010/SubDomainizer.git
cd SubDomainizer
pip3 install -r requirements.txt

echo "Installing dnsGen"

cd ~/tools
git clone https://github.com/ProjectAnte/dnsgen
cd dnsgen
pip3 install -r requirements.txt
python3 setup.py install

echo "Installing altdns"

cd ~/tools/
git clone https://github.com/infosec-au/altdns.git
cd altdns
pip3 install -r requirements.txt
python3 setup.py install

echo "Installing gospider - crawler"

GO11MODULE=on go install github.com/jaeles-project/gospider@latest
ln -s /root/go/bin/gospider /usr/local/bin

echo "Installing hakrawler - crawler"

go install github.com/hakluke/hakrawler@latest
ln -s /root/go/bin/hakrawler /usr/local/bin


echo "***** Installing Port and Service Scanning Tools *****"

echo "Installing masscan"

cd ~/tools
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make
make install

echo "Installing massdns"

cd ~/tools
git clone https://github.com/blechschmidt/massdns.git
cd massdns
make
make install

echo "Installing nmap"

apt-get install nmap -y

echo "Installing brutespray"

cd ~/tools
git clone https://github.com/x90skysn3k/brutespray.git
cd brutespray
pip3 install -r requirements.txt

echo "***** Installing Web Tools *****"

echo "Installing URL Extraction Tools"

echo "Installing waybackurls"

go install github.com/tomnomnom/waybackurls@latest
ln -s /root/go/bin/waybackurls /usr/local/bin

echo "Installing getallurls (gau)"

go install github.com/lc/gau/v2/cmd/gau@latest
ln -s /root/go/bin/gau /usr/local/bin

echo "Installing HTTP Probe Tools"

echo "Installing httprobe"

go install github.com/tomnomnom/httprobe@latest
ln -s /root/go/bin/httprobe /usr/local/bin

echo "Installing httpx"

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
ln -s /root/go/bin/httpx /usr/local/bin

echo "Installing Directory bruteforce tool - gobuster"

go install github.com/OJ/gobuster/v3@latest
ln -s /root/go/bin/gobuster /usr/local/bin

echo "Installing Fuzzing Tool - ffuf"

go install github.com/ffuf/ffuf@latest
ln -s /root/go/bin/ffuf /usr/local/bin

echo "***** Installing Cloud Enumeration tools *****"

echo "Installing S3Scanner"

pip3 install s3scanner

echo "Installing cloud_enum"

cd ~/tools
git clone https://github.com/initstring/cloud_enum.git
cd cloud_enum/
pip3 install -r requirements.txt

echo "***** Installing WebScreenshoting Tool - aquatone *****"

echo "Installing chromium"
snap install chromium

cd ~/tools
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip -d aquatone_zip
cp ~/tools/aquotone_zip/aquatone .

echo "***** Downloading wordlists *****"

cd ~/tools
mkdir wordlists
cd wordlists

echo "Downloading jhaddix - all.txt"
wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt

mkdir commonspeak
cd commonspeak

echo "Downloading commonspeak wordlists"
wget https://raw.githubusercontent.com/assetnote/commonspeak2-wordlists/master/subdomains/subdomains.txt

echo "***** Installing Interlace *****"
cd ~/tools
git clone https://github.com/codingo/Interlace.git
cd Interlace
python3 setup.py install

echo "Installing Nuclei"

go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
ln -s /root/go/bin/nuclei /usr/local/bin

echo "Installing anew"

go install -v github.com/tomnomnom/anew@latest
ln -s /root/go/bin/anew /usr/local/bin


echo "***** Clean Up *****"

echo "Copying python scripts into same directory"

mkdir ~/tools/py-scripts

cp ~/tools/ctfr/ctfr.py ~/tools/py-scripts/
cp ~/tools/SubDomainizer/SubDomainizer.py ~/tools/py-scripts/
cp ~/tools/brutespray/brutespray.py ~/tools/py-scripts/

echo "Deleting installers"

rm -rf ~/tools/aquatone_zip
rm -rf ~/tools/aquatone_linux_amd64_1.7.0.zip
rm -rf ~/tools/brutespray
rm -rf ~/tools/SubDomainizer
rm -rf ~/tools/masscan
rm -rf ~/tools/go1.19.5.linux-amd64.tar.gz
rm -rf ~/tools/assetfinder-linux-amd64-0.1.1.tgz
rm -rf ~/tools/ctfr
