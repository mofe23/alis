#!/usr/bin/env bash
set -e

# Arch Linux Install Script (alis) installs unattended, automated
# and customized Arch Linux system.
# Copyright (C) 2021 picodotdev

GITHUB_USER="mofe23"
BRANCH="master"

while getopts "u:h:" arg; do
  case ${arg} in
    u)
      GITHUB_USER=${OPTARG}
      ;;
    h)
      HOST=${OPTARG}
      ;;
    ?)
      echo "Invalid option: -${OPTARG}."
      exit 1
      ;;
  esac
done

HOST="http://192.168.8.131:8000"
URL=${HOST:-https://raw.githubusercontent.com/$GITHUB_USER/alis/$BRANCH}

echo "User: $GITHUB_USER"
echo "Host: $URL"

rm -f sshd-init.sh
rm -f .env
rm -f alis.conf
rm -f alis.sh
rm -f alis-asciinema.sh
rm -f alis-reboot.sh

rm -f alis-recovery.conf
rm -f alis-recovery.sh
rm -f alis-recovery-asciinema.sh
rm -f alis-recovery-reboot.sh

rm -f alis-packages.conf
rm -f alis-packages.sh
rm -f alis-packages-asciinema.sh
rm -f *.pkg.tar

curl -O $URL/sshd-init.sh
curl -O $URL/.env

curl -O $URL/alis.conf
curl -O $URL/alis.sh
curl -O $URL/alis-asciinema.sh
curl -O $URL/alis-reboot.sh

curl -O $URL/alis-recovery.conf
curl -O $URL/alis-recovery.sh
curl -O $URL/alis-recovery-asciinema.sh
curl -O $URL/alis-recovery-reboot.sh

curl -O $URL/alis-packages.conf
curl -O $URL/alis-packages.sh
curl -O $URL/alis-packages-asciinema.sh

chmod +x sshd-init.sh
chmod +x alis.sh
chmod +x alis-asciinema.sh
chmod +x alis-reboot.sh

chmod +x alis-recovery.sh
chmod +x alis-recovery-asciinema.sh
chmod +x alis-recovery-reboot.sh

chmod +x alis-packages.sh
chmod +x alis-packages-asciinema.sh

curl -O $URL/build/regolith-de/regolith-i3-1.5.3-1-x86_64.pkg.tar
curl -O $URL/build/regolith-de/regolith-desktop-config-1.5.3-1-x86_64.pkg.tar
curl -O $URL/build/regolith-de/regolith-i3xrocks-1.5.3-1-x86_64.pkg.tar
curl -O $URL/build/regolith-de/regolith-styles-1.5.3-1-x86_64.pkg.tar
curl -O $URL/build/regolith-de/regolith-st-1.5.3-1-x86_64.pkg.tar
