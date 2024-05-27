#!/bin/bash
sudo apt install openssh-server openssh-client net-tools
ssh-keygen -t ecdsa -b 521 -C "koji.minoda@tier4.jp" -f ~/.ssh/id_rsa -N ""

if ! (command -v curl >/dev/null 2>&1); then
    sudo apt -y update
    sudo apt -y install curl
fi
if ! (command -v rye >/dev/null 2>&1); then
    # https://rye-up.com/guide/installation/#customized-installation
    curl -sSf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash
fi
source $HOME/.rye/env
if ! (command -v ansible-playbook >/dev/null 2>&1); then
    rye install ansible-core
    ansible-galaxy collection install community.general
fi

ansible-playbook ansible/ubuntu.yml --ask-become-pass -y
