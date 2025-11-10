# macOS Developer Bootstrap Script

A simple script to quickly set up a fresh macOS machine for development.

This script installs:

- Xcode Command Line Tools  
- Homebrew  
- Core developer utilities: Python, Git, Vim, htop, Visual Studio Code, and more  

I created this so that when I get a new laptop, I can have my development environment ready in minutes.

---

## Usage

### Option 1: Download the repo as a ZIP

1. Click **Code → Download ZIP** on GitHub.  
2. Unzip the file and navigate to the directory:

```bash
cd path/to/bootstrap-folder
chmod +x bootstrap.sh
./bootstrap.sh
```

### Option 2: Use curl to download the script directly
```bash
curl -O https://raw.githubusercontent.com/BreckynDev/Mac_Bootstrap/main/bootstrap.sh
chmod +x bootstrap.sh
./bootstrap.sh
```
### Option 3: One-line install
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/BreckynDev/Mac_Bootstrap/main/bootstrap.sh)"
```

## Notes

The script installs the essentials, but you can customize it by adding more tools to the **brew install section**.

- Ex: brew install node, brew install mysql, brew install nmap, or brew install --cask docker

Running the script multiple times is **safe** — Homebrew and Xcode CLI checks prevent reinstallation.

After installation, all tools are ready to use **immediately**.

### Version: 1.0.0 - Nov. 2025
