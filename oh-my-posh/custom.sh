#!/usr/bin/bash

# Download the ohmyposh binary
curl -s https://ohmyposh.dev/install.sh | sudo bash -s -- -d /usr/local/bin

sudo rm -rf /root/.cache/oh-my-posh
