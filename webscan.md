Web Security Scanner Script – README
Overview
This script is really simple. It checks how secure a website is. It does this by checking if the website's online, looking at some common ports and getting the HTTP headers from the website.
It is a Bash script that performs a web security scan on a given URL.
Requirements
You need to have some tools installed on your computer to use this script. These tools are curl, nmap and a Linux environment.
You can install these tools by running these commands in your terminal:
sudo update
sudo apt install curl nmap
File Structure
The main script is called webscan.sh.
Usage
To use this script you need to follow these steps:
Step 1: You need to give the script permission to run. You can do this by running this command:
chmod +x webscan.sh
Step 2: Now you can run the script by typing this command and adding the website you want to scan:
./webscan.sh <url>
For example if you want to scan the website https://example.com you would type:
./webscan.sh https://example.com
Features
The web security scanner script has these features:
1. It checks if the website is online using curl.
2. It scans some ports using nmap, like port 80 and port 443.
3. It analyzes the HTTP headers from the website.
Output
When you run the script it will show you the HTTP status of the website, which portsre open or closed and the server headers
Limitations
This script is very basic. It only scans some common ports. It does not check for any security problems.
Disclaimer
You should only use this script on websites that you own or have permission to test. Scanning a website without permission may be, against the law. You could get in trouble. Always make sure you have permission to scan a website before you use the web security scanner script.
