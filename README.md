# void-setup

> ⚠️ Currently a WIP! Not-tested! Use at own risk!

Since ditching MacOS and Windows a few years ago, I've just run Kubuntu (Ubuntu with KDE) and Linux Mint as simple, near-zero configuration installations that _Just Work ™️_. For fun, I decided to dig out my 15+ year old Lenovo Thinkpad T410 and get a lightweight linux distro running on it for a sort-of distraction free writing computer — it still has one of the best laptop keyboards.

I had heard about Void Linux at some point and have decided to give it a go. However, I didn't want to spend all this time getting it setup and then have no idea how I got there. So, instead, as I'm testing out different packages and getting my requirements settled, I'm building simple scripts to automate the setup.

## Initial steps

To download any file you will need to have `git`, `curl` or `wget` installed, which is not the case with the base Void image. But, before you can install a package with xbps, the system will ask you to update the `xbps` package itself and you may as well just run a full system update on the base packages. Long story short, these are the few commands you have to manually type to get this going:

```bash
# as sudo

xbps-install -Syu
xbps-install -Syu xbps git

```

Initialize your git config:

```bash
git config --global user.name "My Name"
git config --global user.email "me@example.org"
git config --global push.default simple
```

Download this repo:

```bash
git checkout git@github.com:staydecent/void-setup.git ~/
```

Now, simply run the setup script of choice:

```bash
sudo source ~/void-setup/thinkpad.sh
```

## File structure

Shell scripts with a preceding `_` are not meant to be sourced directly from the command line. Instead, a parent script should be created. The idea is to have a script for each of my computers as they serve slightly different purposes and thus have different package needs.

For example, my ThinkPad will be using basic tiling window manager and X11. Where as, if I migrate my desktop to Void it will use a more modern/dynamic/stacking window manager and possible Wayland.

## Other notes

Again, this is WIP and I have not completed the initial scripts for my ThinkPad yet. This should not be used by anyone, except maybe as inspiration :)


**Helpful Links**

- [xbps docs](https://docs.voidlinux.org/xbps/index.html)
