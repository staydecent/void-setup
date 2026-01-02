#!/usr/bin/env bash
set -e
set -u

echo "=== DWM Setup Script for Void Linux ==="
echo "This script will install dwm and its dependencies"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "This script must be run as root"
    exit 1
fi

# Update package manager
echo "[*] Updating xbps package manager..."
xbps-install -Suv

# Install required dependencies
echo "[*] Installing required packages and dependencies..."
xbps-install -Sy \
    base-devel \
    libX11-devel \
    libXft-devel \
    libXinerama-devel \
    freetype-devel \
    fontconfig-devel \
    pkg-config \
    git \
    wget \
    make \
    gcc

# Create a temporary directory for building
BUILD_DIR=$(mktemp -d)
trap "rm -rf $BUILD_DIR" EXIT

echo "[*] Downloading dwm source code..."
cd "$BUILD_DIR"

# Clone dwm repository (using git)
# If you prefer a specific version, you can checkout a tag
git clone https://git.suckless.org/dwm
cd dwm

echo "[*] Configuring dwm..."
# Copy default config if needed (optional)
# cp config.def.h config.h

echo "[*] Compiling dwm..."
make clean
make

echo "[*] Installing dwm..."
make install

echo ""
echo "=== Installation Complete ==="
echo "dwm has been successfully installed!"
echo ""
echo "To use dwm:"
echo "1. Add 'exec dwm' to your ~/.xinitrc file"
echo "2. Start X with 'startx' command"
echo ""
echo "For more information, visit: https://dwm.suckless.org/"
