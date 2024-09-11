#!/bin/bash

# Function to validate email address
validate_email() {
    if [[ "$1" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]; then
        return 0
    else
        return 1
    fi
}

# Check if an email address is provided as an argument
if [ $# -eq 0 ]; then
    echo "Error: Please provide an email address as an argument."
    echo "Usage: $0 <email_address>"
    exit 1
fi

# Validate the provided email address
if ! validate_email "$1"; then
    echo "Error: Invalid email address format."
    echo "Please provide a valid email address."
    exit 1
fi

# Install SSH server and client
sudo apt install openssh-server openssh-client

# Generate SSH key
ssh-keygen -t ecdsa -b 521 -C "$1" -f ~/.ssh/id_rsa -N ""

echo "SSH key generated successfully with email: $1"
