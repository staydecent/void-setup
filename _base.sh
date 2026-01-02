#!/usr/bin/env bash
set -e
set -u

echo "=== Setup Script for Void Linux ==="
echo ""

if [ "$EUID" -ne 0 ]; then 
    echo "This script must be run as root"
    exit 1
fi

# The system was likely just updated, but keeping these in for redundancy

echo "[*] Updating xbps package manager..."
xbps-install -Syu xbps

echo "[*] Updating system..."
xbps-install -Syu

echo "[*] Installing preferred packages..."
xbps-install -Sy \
    apparmor \
    console-setup \
    curl \
    fish-shell \
    fzf \
    gawk \
    git \
    kakoune \
    lowdown \
    neovim \
    redshift \
    rsync \
    sed \
    stow \
    tzdata \
    ufetch \
    wget \
    xclip

echo "[*] Setting console font to \"Lat2-Terminus16\"..."
sed -i 's/^#*\s*FONT=.*/FONT="Lat2-Terminus16"/' /etc/rc.conf

echo "[*] Adding app armor to linux cmdline via grub..."
# see: https://docs.voidlinux.org/config/security/apparmor.html
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 apparmor=1 security=apparmor"/' /etc/default/grub
# remove extra whitespace, if any
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="  /GRUB_CMDLINE_LINUX_DEFAULT=" /' /etc/default/grub

update-grub
