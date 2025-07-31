# Project 1.3: Automated Development Environment Setup Script

> An idempotent Bash script to automate the provisioning of a standard development environment on a fresh Ubuntu/Debian-based system.

This project combines system administration, conditional logic, and automation to solve a common and critical engineering problem: ensuring a consistent and reliable development environment.

## Overview

Manually setting up a new computer or server is a tedious and error-prone process. It's easy to forget a tool or install an incorrect version, leading to the classic "it works on my machine" problem. This script solves that by codifying the setup process.

It automates the installation of essential development tools like Git, Python, and `htop`. 

## Features

* **Automated:** Installs a suite of essential development tools with a single command.
* **Idempotent:** The script can be run safely multiple times. It intelligently checks if a tool is already installed before attempting to install it again, preventing errors and unnecessary work.
* **System Updates:** Automatically runs `apt-get update` to ensure the system's package list is up-to-date before installing new software.
* **User-Friendly Output:** Prints clear, informative messages to the console, indicating which tools are being installed and which are already present.

## Prerequisites

This script is designed to be run on a fresh, **Ubuntu or Debian-based** Linux system with `sudo` privileges. It relies on the following core utilities:
* `bash`
* `apt-get` (Advanced Package Tool)
* `sudo`

## Usage

1.  **Make the script executable:**
    Before its first use, you must give the script execute permissions.
    ```bash
    chmod +x setup.sh
    ```

2.  **Run the script:**
    Execute the script from your terminal. It will prompt you for your password to gain the necessary `sudo` privileges for installing system-wide software.

    ```bash
    ./setup.sh
    ```
    The script will then proceed to update the system and install the required packages, printing its progress along the way.

## How It Works

The script follows a safe and logical sequence to provision the environment:

1.  **Update Package Manager:** The script begins by running `sudo apt-get update -y`. This is a critical first step that resynchronizes the local package index with the central repositories, ensuring that `apt` knows about the latest available versions of software.

2.  **Check for Existing Tools:** For each tool, the script uses an `if` statement with the `command -v` command.
    ```bash
    if ! command -v git &> /dev/null
    ```
    * `command -v git` checks if the `git` command is available in the system's PATH.
    * The `!` negates the result, so the `if` block is only entered if the command is **not** found.
    * `&> /dev/null` redirects any output (both standard and error) to `/dev/null`, a special file that discards all data written to it. This keeps the script's output clean.

3.  **Conditional Installation:** If a tool is not found, the script prints a message and then runs `sudo apt-get install -y <package_name>`. The `-y` flag automatically answers "yes" to any confirmation prompts, allowing the script to run without user interaction. If the tool is already present, the script simply prints a confirmation message and moves on.

This check-then-install pattern is what makes the script **idempotent**—a core principle in infrastructure automation.

