#!/bin/bash

# Project 1.3: Environment Setup Script
# This script automates the installation of standard development tools
# on a fresh Ubuntu/Debian-based system.

echo "--- Starting Environment Setup ---"

# Update the package list to get the latest versions
echo "Updating package list..."
sudo apt-get update -y

# --- Install Essential Tools ---

# Install git
# We check if the command 'git' exists before trying to install it.
if ! command -v git &> /dev/null
then
    echo "Installing git..."
    sudo apt-get install -y git
else
    echo "git is already installed."
fi

# Install Python3 and pip
if ! command -v python3 &> /dev/null
then
    echo "Installing python3 and pip..."
    sudo apt-get install -y python3 python3-pip
else
    echo "python3 is already installed."
fi

# Install htop (a useful process viewer)
if ! command -v htop &> /dev/null
then
    echo "Installing htop..."
    sudo apt-get install -y htop
else
    echo "htop is already installed."
fi


echo "--- Environment Setup Complete ---"