#!/bin/bash

TARGET=$1

# Check input
if [ -z "$TARGET" ]; then
  echo "Usage: sudo ./scanner.sh <target>"
  exit 1
fi

echo "🔍 NETWORK AUDIT: $TARGET"
echo "----------------------------------"

# 1. Host Discovery
echo "[+] Discovering live hosts..."
nmap -sn $TARGET -oG live_hosts.txt > /dev/null

# Extract valid hosts (filter + remove duplicates)
LIVE_HOSTS=$(grep "Status: Up" live_hosts.txt | awk '{print $2}' | grep -v "\.0$" | sort -u)

if [ -z "$LIVE_HOSTS" ]; then
  echo "[-] No live hosts found"
  exit 1
fi

echo "[+] Live hosts:"
echo "$LIVE_HOSTS"
echo ""

# 2. Port Scanning
echo "[+] Scanning ports..."
for host in $LIVE_HOSTS; do
  echo "---- $host ----"
  nmap -sS -T4 $host
done

# 3. Service Detection
echo ""
echo "[+] Service & Version Detection..."
for host in $LIVE_HOSTS; do
  echo "---- $host ----"
  nmap -sV $host
done

# 4. Optional Vulnerability Scan
echo ""
read -p "Run vulnerability scan? (y/n): " choice

if [ "$choice" == "y" ]; then
  echo ""
  echo "[+] Running vulnerability scan..."
  for host in $LIVE_HOSTS; do
    echo "---- $host ----"
    nmap --script vuln $host
  done
fi

echo ""
echo "✅ Scan completed"
