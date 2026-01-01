#!/bin/bash

# update xbps itself
xbps-install -Syu xbps

# update system 
xbps-install -Syu

# base packages
xbps-install -Sy apparmor console-setup curl fish-shell fzf git kakoune lowdown neovim redshift rsync tzdata ufetch wget

# app armor
