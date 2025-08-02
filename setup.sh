#!/bin/bash

# Project 1.3: Environment Setup Script
echo "--- Starting Environment Setup ---"

echo "Updating package list..."
sudo apt-get update -y

# Install git (or check if it exists already)

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

# Install htop 
if ! command -v htop &> /dev/null
then
    echo "Installing htop..."
    sudo apt-get install -y htop
else
    echo "htop is already installed."
fi


echo "--- Environment Setup Complete ---"
