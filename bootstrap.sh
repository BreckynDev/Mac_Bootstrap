#!/usr/bin/env bash
set -e

read -p "This will install tools on your machine. Continue? (y/n): " answer
if [[ $answer != "y" ]]; then
  echo "Canceled."
  exit 0
fi

echo "===== Bootstrapping fresh mac dev environment ====="

# Xcode CLI tools
if ! xcode-select -p >/dev/null 2>&1; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
fi

# Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ensure brew is on PATH for both intel and apple silicon
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Updating brew..."
brew update

# essentials
brew bundle --file Brewfile

echo "===== Bootstrap complete ====="
