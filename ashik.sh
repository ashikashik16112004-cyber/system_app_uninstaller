#!/bin/bash

# Checking and installing figlet automatically if it's missing
if ! command -v figlet &> /dev/null; then
    echo "[*] Installing required packages (figlet)..."
    pkg install figlet -y || apt-get install figlet -y
fi

clear
# Advanced Figlet Banner
figlet -f slant "Ashik Tool"
echo "=================================================="
echo "    Smart App Uninstaller - Advanced Edition      "
echo "             Created by: Ashik                    "
echo "=================================================="
echo ""

echo "[*] Initializing Wireless Debugging Setup..."
echo "--------------------------------------------------"

# Perfectly aligned inputs - Only 3 Inputs exactly as you asked!
printf "[?] Target IP Address     [Ex: 192.168.1.5] : "
read ip_addr

printf "[?] Port Number           [Ex: 35237]       : "
read port

printf "[?] 6-Digit Pairing Code  [Ex: 123456]      : "
read pair_code

echo "--------------------------------------------------"
echo "[*] Attempting to pair with the device..."
adb pair $ip_addr:$port $pair_code

echo ""
echo "[*] Verifying Connection:"
adb devices
echo ""

echo "--------------------------------------------------"
printf "[?] App Name to Uninstall [Ex: netflix]     : "
read app_name
echo "--------------------------------------------------"

echo ""
echo "[*] Searching for '$app_name' packages... Please wait!"

packages=$(adb shell pm list packages | grep -i "$app_name" | cut -d':' -f2 | tr -d '\r')

if [ -z "$packages" ]; then
    echo "[-] Error: No matching packages found for '$app_name'!"
else
    echo "[+] Success! Found the following packages:"
    echo "$packages"
    echo ""

    for pkg in $packages; do
        echo "[*] Uninstalling: $pkg ..."
        adb shell pm uninstall -k --user 0 "$pkg"
    done

    echo ""
    echo "[+] Operation Completed! App(s) successfully uninstalled."
fi
echo "=================================================="
