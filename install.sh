#!/bin/bash
clear
echo "=================================================="
echo "    Installing Requirements for Ashik Tool...     "
echo "=================================================="
echo ""

# Checking for Termux (pkg) or Linux (apt)
if command -v pkg &> /dev/null; then
    echo "[*] Termux detected! Installing packages..."
    pkg update -y
    pkg install figlet android-tools -y
elif command -v apt-get &> /dev/null; then
    echo "[*] Linux detected! Installing packages..."
    sudo apt-get update -y
    sudo apt-get install figlet adb -y
else
    echo "[-] Unsupported system. Please install figlet and adb manually."
    exit 1
fi

echo ""
echo "[*] Granting execution permissions to main script..."
chmod +x ashik.sh

echo "--------------------------------------------------"
echo "[+] Installation Completed Successfully!"
echo "[+] Now you can run the tool by typing: ./ashik.sh"
echo "=================================================="
