#!/usr/bin/env bash
# this script is a part of Vega's install automation project, do not use by itself.

STARTDIR=$(pwd)

mkdir -p ~/software
cd ~/software || exit

git clone https://github.com/tuxedocomputers/tuxedo-keyboard
cd tuxedo-keyboard || exit
git checkout release

cd $STARTDIR || exit
sudo ln -s ./misc/tuxedo-loader /usr/local/bin/tuxedo-loader
sudo ln -s ./misc/tuxedo-driver-loader.service /etc/systemd/system/tuxedo-driver-loader.service
sudo systemctl daemon-reload
sudo systemctl enable tuxedo-driver-loader
sudo systemctl restart tuxedo-driver-loader