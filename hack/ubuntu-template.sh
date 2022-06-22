#!/bin/bash
set -euo pipefail
sudo swapoff -a 
sudo sed -ie '/.*swap.*/d' /etc/fstab
sudo sh -c 'echo "runtime ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/runtime'
sudo rm -vf /swap.img
sudo apt update
sudo apt remove --purge --assume-yes snapd
sudo apt upgrade -y
sudo apt install -y \
    vim \
    htop \
    net-tools \
    iperf3 \
    tmux \
    qemu-guest-agent
sudo systemctl enable --now qemu-guest-agent
sudo apt clean && sudo apt autoremove -y
sudo rm -rf /etc/ssh/ssh_host_*
sudo truncate -s 0 /etc/machine-id
history -c