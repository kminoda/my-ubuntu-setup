#!/bin/bash
sudo apt install openssh-server openssh-client
ssh-keygen -t ecdsa -b 521 -C "koji.minoda@tier4.jp" -f ~/.ssh/id_rsa -N ""
