#!/bin/bash
# Path to store the last known IP
IP_FILE="last_ip.txt"
echo "Current IP file contents: " $(cat "$IP_FILE")
# Get current public IP from a reliable service
# Alternatives: ifconfig.me, icanhazip.com, api.ipify.org
CURRENT_IP=$(curl -s https://ipinfo.io/ip)

# Check if the storage file exists; if not, create it
if [ ! -f "$IP_FILE" ]; then
    echo "$CURRENT_IP" > "$IP_FILE"
    echo "Initial IP recorded: $CURRENT_IP"
    exit 0
fi

# Read the last recorded IP
LAST_IP=$(cat "$IP_FILE")

# Compare current IP with last recorded IP
if [ "$CURRENT_IP" != "$LAST_IP" ]; then
    echo "IP CHANGED! Old: $LAST_IP, New: $CURRENT_IP"
    # Update the file with the new IP
    echo "$CURRENT_IP" > "$IP_FILE"
    # send email via python (may need to change version of python used here)
    python3 send_email.py $CURRENT_IP
else
    echo "IP has not changed: $CURRENT_IP"
fi