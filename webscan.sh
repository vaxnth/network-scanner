#!/bin/bash

URL=$1
if [ -z "$URL" ]; then
  echo "Usage: ./webscan.sh <url>"
  exit 1
fi
echo "🌐 WEB SECURITY SCAN: $URL"
echo "----------------------------------"
DOMAIN=$(echo "$URL" | awk -F/ '{print $3}')
echo "[+] Checking connectivity..."
curl -Is "$URL" | head -n 1
echo ""
echo "[+] Scanning common web ports..."
nmap -p 80,443 "$DOMAIN"
echo ""
echo "[+] Checking HTTP headers..."
curl -I "$URL"

echo ""
echo " Scan completed"
