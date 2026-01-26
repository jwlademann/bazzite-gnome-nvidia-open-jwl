#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# dnf5 install -y tmux
dnf5 -y install gparted
dnf5 -y install blueman blueman-nautilus

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 -y copr enable lukenukem/asus-linux
dnf5 -y install asusctl asusctl-rog-gui
dnf5 -y copr disable lukenukem/asus-linux
dnf5 -y copr enable jwlademann/gnome-settings-daemon
dnf5 -y install gnome-settings-daemon-49.1-3.fc43.jwl.x86_64
dnf5 -y copr disable jwlademann/gnome-settings-daemon
dnf5 -y copr enable starfish/howdy-beta
dnf5 -y install howdy howdy-gtk
dnf5 -y copr disable starfish/howdy-beta

#### Example for enabling a System Unit File

# systemctl enable podman.socket
