#!/usr/bin/env bash
set -e
set -u

echo "[Installing Opebox]"
echo ""

if [ "$EUID" -ne 0 ]; then 
    echo "This script must be run as root"
    exit 1
fi

select_video_driver() {
    local options=("xf86-video-nouveau" "xf86-video-amdgpu" "xf86-video-intel")
    local PS3="Select your GPU video driver (1-3): "
    
    COLUMNS=1
    
    select driver in "${options[@]}"
    do
        [ -n "$driver" ] && echo "$driver" && break
        echo "Invalid selection. Please try again."
    done
}

echo "Select your video driver:"
VIDEO_DRIVER=$(select_video_driver)
echo "✓ Selected: $VIDEO_DRIVER"
echo ""

echo "[*] Installing packages for Openbox with $VIDEO_DRIVER..."
xbps-install -Syu \
    xorg-minimal \
    "$VIDEO_DRIVER" \
    openbox \
    jgmenu \
    polybar \
    qterminal
