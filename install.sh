#!/bin/bash

#####################################################################

# #

# Tested on Debian 11.02-amd64 #

# #

#####################################################################


apt-get update -y
apt-get upgrade -y

apt-get install python3 git wget snapd python3-pip git make gcc -y
snap install core

echo "Creating folder for installers"

mkdir ~/installers

echo "Installing golang"

cd ~/installers
wget https://go.dev/dl/go1.19.5.linux-amd64.tar.gz
tar -zxvf go1.19.5.linux-amd64.tar.gz -C /usr/local/
echo "export PATH=/usr/local/go/bin:${PATH}" | tee /etc/profile.d/go.sh
source /etc/profile.d/go.sh

echo "Installing tools for finding Seed Domains"

	echo "Installing amass"
	
		snap install amass
		ln -s /snap/bin/amass /usr/local/bin

	echo "Installing Asnlookup"

		git clone https://github.com/yassineaboukir/Asnlookup
		cd Asnlookup
		pip3 install -r requirements.txt
		cd ~/installers
		
	echo "Installing getrelationship.py"
	
		cd ~/installers
		pip3 install lxml
		wget https://raw.githubusercontent.com/m4ll0k/BBTz/master/getrelationship.py
		
echo "Installing tools for finding subdomains"

	echo "Installing subdomain scrappers"

		echo "Installing subfinder"
		
		   go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
		   ln -s /root/go/bin/subfinder /usr/local/bin
		   
		echo "Installing github-subdomains"
		
			go install github.com/gwen001/github-subdomains@latest
			ln -s /root/go/bin/github-subdomains /usr/local/bin
			
		echo "Installing ctfr"

			cd ~/installers
			git clone https://github.com/UnaPibaGeek/ctfr.git
			cd ctfr/
			pip3 install -r requirements.txt
			
		echo "Installing analyticsRelationships"
		
			cd ~/installers
			git clone https://github.com/Josue87/AnalyticsRelationships.git
			cd AnalyticsRelationships/Python
			pip3 install -r requirements.txt
			
	echo "Installing subdomainizer"
	
		cd ~/installers
		git clone https://github.com/nsonaniya2010/SubDomainizer.git
		cd SubDomainizer
		pip3 install -r requirements.txt
		
	echo "Downloading Subdomain bruteforcer wordlist - all.txt"
	
		cd ~/installers
		wget https://gist.githubusercontent.com/jhaddix/86a06c5dc309d08580a018c66354a056/raw/96f4e51d96b2203f19f6381c8c545b278eaa0837/all.txt

	echo "Installing crawlers"

		echo "Installing gospider"
		
			GO111MODULE=on go install github.com/jaeles-project/gospider@latest	
			ln -s /root/go/bin/gospider /usr/local/bin
			
		echo "Installing hakrawler"

			go install github.com/hakluke/hakrawler@latest
			ln -s /root/go/bin/hakrawler /usr/local/bin
			
	echo "Installing cloud checkers"

		echo "Installing cloudenum"
		
			cd ~/installers
			git clone https://github.com/initstring/cloud_enum.git
			cd cloud_enum/
			pip3 install -r ./cloud_enum/requirements.txt
			
		echo "Installing S3Scanner"
		
			pip3 install s3scanner

echo "Installing Port and Service Scanning Tools"

		echo "Installing masscan"

			cd ~/installers
			git clone https://github.com/robertdavidgraham/masscan
			cd masscan
			make
			make install

		echo "Installing nmap"

			apt-get install nmap -y

		echo "Installing brutespray"
		
			cd ~/installers
			git clone https://github.com/x90skysn3k/brutespray.git
			cd brutespray
			pip3 install -r requirements.txt
			
echo "Installing Web Tools"

	echo "Installing HTTP Probe Tools"
		
		 echo "Installing httprobe"

			go install github.com/tomnomnom/httprobe@latest
			ln -s /root/go/bin/httprobe /usr/local/bin
			
	echo "Installing URL Extractions tools"
	
		echo "Installing waybackurls"

			go install github.com/tomnomnom/waybackurls@latest
			ln -s /root/go/bin/waybackurls /usr/local/bin
			
		echo "Installing gau"

			go install github.com/lc/gau/v2/cmd/gau@latest
			ln -s /root/go/bin/gau /usr/local/bin
			
	echo "Installing Fuzzing Tools"
	
		echo "Installing ffuf"

			go install github.com/ffuf/ffuf@latest
			ln -s /root/go/bin/ffuf /usr/local/bin
			
	echo "Installing Directory Bruteforcer Tools"
	
		echo "Installing gobuster"

			go install github.com/OJ/gobuster/v3@latest
			ln -s /root/go/bin/gobuster /usr/local/bin
			
echo "Installing Multithreading Tools"
	
	echo "Installing interlace"
	
		cd ~/installers
		git clone https://github.com/codingo/Interlace.git
		cd Interlace
		python3 setup.py install

echo "Copying python scripts into same directory"

	mkdir ~/py-scripts
	cp ~/installers/Asnlookup/asnlookup.py ~/py-scripts/
	cp ~/installers/getrelationship.py ~/py-scripts/
	cp ~/installers/ctfr/ctfr.py ~/py-scripts/
	cp ~/installers/AnalyticsRelationships/Python/analyticsrelationships.py ~/py-scripts/
	cp ~/installers/SubDomainizer/SubDomainizer.py ~/py-scripts/
	cp ~/installers/cloud_enum/cloud_enum.py ~/py-scripts/
	cp ~/installers/brutespray/brutespray.py ~/py-scripts/
	cp ~/installers/Interlace/Interlace/interlace.py ~/py-scripts/
	cp ~/installers/all.txt ~/.

echo "sym links created for following tools"

	echo "amass"
	echo "subfinder"
	echo "github-subdomains"
	echo "gospider"
	echo "hakrawler"
	echo "httprobe"
	echo "waybackurls"
	echo "gau"
	echo "ffuf"
	echo "gobuster"

echo "Clean Up - Removing Installers folder"
	rm -rf ~/installers
