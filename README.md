# Windows 11 Setup Automation
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Overview
This script automates the installation of essential applications using Winget, removes unwanted pre-installed Windows 11 apps (bloatware), and configures several privacy and telemetry settings to enhance your system’s security and performance.

# Features
Installs popular applications silently via Winget, including:

Bitwarden, ProtonVPN, Steam, Discord, Brave Browser, WinRAR, qBittorrent, Microsoft PC Manager, Autoruns, Notepad++, VLC and O&O ShutUp10++

Removes common Windows 11 pre-installed apps considered unnecessary or intrusive.

Disables advertising IDs, telemetry, location services, voice recognition, activity history, and other data collection features.

Turns off suggested content on Start menu and lock screen.

# How to Use
Download the script file (.bat).

Run as Administrator by right-clicking the file and selecting "Run as Administrator".

The script will:

Check if Winget is installed.

Install the listed apps silently.

Remove Windows 11 bloatware apps.

Apply privacy and telemetry disabling registry changes.

When finished, the script will pause and show a completion message.

# Requirements
Winget package manager (comes preinstalled on recent Windows versions).

Administrator privileges.

# Notes
The script modifies registry keys and removes built-in apps, so use it with caution.

Changes apply to the current user and system-wide settings, but not automatically to new user profiles.

Some apps and settings may differ depending on your Windows version.

# Contributing
Feel free to open issues or submit pull requests for improvements or bug fixes.
