Network Scanner Script – README
Overview
This script is really useful for checking your network. It uses a tool called nmap to do a check of your network. The Network Scanner Script discovers hosts on the network scans for open ports detects what services are running and what versions they are and it can even check for vulnerabilities if you want it to.
Requirements
To use the Network Scanner Script you need to have a few things installed on your computer. You need to have nmap a Linux environment like Kali Linux or Ubuntu. You need to have root privileges.
You can install nmap by running these commands:
sudo update
sudo apt install nmap
File Structure
The Network Scanner Script has a few different parts. There is the script, which is called scanner.sh. Then there is a file called live_hosts.txt which the script makes automatically.
Usage
To use the Network Scanner Script you need to follow a steps.
Step 1: You need to give the script permission to run. You can do this by running the command:
chmod +x scanner.sh
Step 2: Then you can run the script by running the command:
sudo./scanner.sh. Then the target network you want to scan.
For example you could run the command:
sudo./scanner.sh 192.168.1.0/24
Features
The Network Scanner Script has a few features.
1. It can discover hosts on the network using nmap -sn.
2. It can scan for ports using -sS.
3. It can detect what services are running using -sV.
4. It can even do a vulnerability scan using --script vuln.
Bug Fix
We found a mistake in the script. The mistake was in this line:
if [ "$choice" == "y" ]; the
It should be:
if [ "$choice" == "y" ]; then
Output
When you run the Network Scanner Script it will show you a lot of information. It will show you what hosts are live on the network what ports are open what services are. If there are any vulnerabilities.
Disclaimer
You should only use the Network Scanner Script on networks that you own or have permission to scan. Scanning a network without permission may be, against the law.
