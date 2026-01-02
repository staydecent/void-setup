#!/usr/bin/env bash
set -e
set -u

git clone git@github.com:staydecent/.dotfiles.git ~/
stow -v .
