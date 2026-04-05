#!/bin/bash
TARGET=$1
if [ -z "$TARGET" ]; then
  echo "Usage: sudo ./scanner.sh <target>"
  exit 1
fi
echo "🔍 NETWORK AUDIT: $TARGET"
echo "----------------------------------"
echo "[+] Discovering live hosts..."
nmap -sn $TARGET -oG live_hosts.txt > /dev/null
LIVE_HOSTS=$(grep "Status: Up" live_hosts.txt | awk '{print $2}' | grep -v "\.0$" | sort -u)
if [ -z "$LIVE_HOSTS" ]; then
  echo "[-] No live hosts found"
  exit 1
fi
echo "[+] Live hosts:"
echo "$LIVE_HOSTS"
echo ""
echo "[+] Scanning ports..."
for host in $LIVE_HOSTS; do
  echo "---- $host ----"
  nmap -sS -T4 $host
done
echo ""
echo "[+] Service & Version Detection..."
for host in $LIVE_HOSTS; do
  echo "---- $host ----"
  nmap -sV $host
done
echo ""
read -p "Run vulnerability scan? (y/n): " choice
if [ "$choice" == "y" ]; the
  echo ""
  echo "[+] Running vulnerability scan..."
  for host in $LIVE_HOSTS; do
    echo "---- $host ----"
    nmap --script vuln $host
  done
fi
echo ""
echo " Scan completed"
