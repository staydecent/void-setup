#!/usr/bin/env bash
set -e
set -u

# update xbps itself
xbps-install -Syu xbps

# update system 
xbps-install -Syu

# base packages
xbps-install -Sy apparmor console-setup curl fish-shell fzf git kakoune lowdown neovim redshift rsync tzdata ufetch wget

# add app armor to kernel commandline
# see: https://docs.voidlinux.org/config/security/apparmor.html
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 apparmor=1 security=apparmor"/' /etc/default/grub
# remove extra whitespace, if any
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="  /GRUB_CMDLINE_LINUX_DEFAULT=" /' /etc/default/grub

update-grub
