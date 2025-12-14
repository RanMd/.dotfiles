#!/bin/bash

# Description: Post-installation script for setting up the environment after installation.

# Disable the swap partition if enabled

fstab_file="/etc/fstab"

swap_partition=$(grep -E 'swap|swapfile' "$fstab_file")

if [[ -n "${swap_partition}" && $(echo ${swap_partition} | cut -c1) != "#" ]]; then
  echo "Disabling swap partition..."
  echo $swap_partition
  swapon_partition=$(swapon --show | grep -Ev 'zram|NAME' | cut -d ' ' -f 1)
  echo "Swap partition found: $swapon_partition"
  sudo swapoff ${swapon_partition}
  sudo sed -i "s/${swap_partition}/#${swap_partition}/" "$fstab_file"
else
  echo "No swap partition found."
fi

source ~/.local/bin/init-ram-cache

# Install yazi plugins

ya pkg add yazi-rs/plugins:git
ya pkg add yazi-rs/plugins:toggle-pane
ya pkg add imsi32/yatline
