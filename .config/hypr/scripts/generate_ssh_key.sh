#!/bin/bash

# Check if email argument is provided
if [ -z "$1" ]; then
  echo "Error: Please provide an email address"
  echo "Usage: $0 your_email@example.com"
  exit 1
fi

EMAIL="$1"

# Check if ssh-agent is running, start it if not
eval "$(ssh-agent -s)" >/dev/null

# Generate SSH key if it doesn't exist
if [ ! -f ~/.ssh/id_ed25519 ]; then
  ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519 -N "" >/dev/null
  echo "SSH key generated successfully"
else
  echo "SSH key already exists"
fi

# Add the SSH private key to the agent
ssh-add ~/.ssh/id_ed25519 >/dev/null

# Print the public key
echo "Your public SSH key :"
cat ~/.ssh/id_ed25519.pub
