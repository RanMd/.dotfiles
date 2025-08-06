#!/usr/bin/bash

# Install Visual Studio Code oficial bin
paru -S visual-studio-code-bin

sudo chown -R $(whoami) '/opt/visual-studio-code/resources/app/'

echo -e "\e[31mTIP IMPORTANT: If is a reinstall, delete the /opt/visual-studio-code/resources/app/ folder\e[0m"
