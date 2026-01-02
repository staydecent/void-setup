#!/usr/bin/env bash
set -e
set -u

# update xbps itself
xbps-install -Syu xbps

# update system 
xbps-install -Syu

# base packages
xbps-install -Sy apparmor console-setup curl fish-shell fzf gawk git kakoune lowdown neovim redshift rsync sed stow tzdata ufetch wget xclip

# set console font
sed -i 's/^#*\s*FONT=.*/FONT="Lat2-Terminus16"/' /etc/rc.conf

# add app armor to kernel commandline
# see: https://docs.voidlinux.org/config/security/apparmor.html
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 apparmor=1 security=apparmor"/' /etc/default/grub
# remove extra whitespace, if any
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="  /GRUB_CMDLINE_LINUX_DEFAULT=" /' /etc/default/grub

update-grub

# git
git config --global push.default simple

echo "Please set the following git configs, then execute `./dotfiles.sh`: \n"
echo "git config --global user.name \"XX\" \ngit config --global user.email \"YY\"\n"
echo "ssh-keygen -t rsa -b 4096 -C \"YY\""
