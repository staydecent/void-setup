#!/usr/bin/env bash
set -e
set -u

echo "=== Setup Script for DK Window Manager ==="
echo ""

if [ "$EUID" -ne 0 ]; then 
    echo "This script must be run as root"
    exit 1
fi

echo "[*] Installing packages for dk..."
xbps-install -Syu \
	xorg-minimal \
	xf86-video-nouveau `# this should move to device specific script` \
	sxhkd \
	dk \
	polybar \
	rofi \
	qterminal
