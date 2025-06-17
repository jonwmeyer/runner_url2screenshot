#!/bin/bash

# Setup script for URL Screenshot Tool on Ubuntu 22.04 LTS
echo "[*] Setting up URL Screenshot Tool..."

# Update package list
echo "[*] Updating package list..."
sudo apt update

# Install Python 3 and pip if not already installed
echo "[*] Installing Python 3 and pip..."
sudo apt install -y --reinstall python3 python3-pip python3-venv

# Create virtual environment
echo "[*] Creating virtual environment..."
python3 -m venv venv

# Activate virtual environment
echo "[*] Activating virtual environment..."
source venv/bin/activate

# Install Python dependencies
echo "[*] Installing Python dependencies..."
pip install -r requirements.txt
echo "[*] Setup complete!"
echo "[*] To use the tool:"
echo "    1. Set your Scrapfly API key: export SCRAPFLY_API_KEY='your-api-key-here'"
echo "    2. Run: ./run.sh https://example.com"
echo "    Or activate the virtual environment and run: python3 app.py https://example.com"
