#!/bin/sh
set -e

BASE="https://raw.githubusercontent.com/tarek1902/OSCAM-NCAM/refs/heads/main"
IPK="oscam-11989-emu-802.ipk"
DEB="oscam-11989-emu-802.deb"

if command -v opkg >/dev/null 2>&1; then
    wget -qO "/tmp/$IPK" "$BASE/$IPK"
    opkg install --force-reinstall "/tmp/$IPK"

elif command -v dpkg >/dev/null 2>&1; then
    wget -qO "/tmp/$DEB" "$BASE/$DEB"
    dpkg -i "/tmp/$DEB"

else
    echo "Unsupported system: opkg/dpkg not found"
    exit 1
fi

echo "         UPLOADED BY TARK_HANFY    "

killall -9 enigma2

sleep 2;
