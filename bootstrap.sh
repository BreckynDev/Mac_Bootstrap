#!/usr/bin/env bash
set -e

FILE="/tmp/install.sh"

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
if ! command -v brew >/dev/null 2>&1; then # <-- Start of 'if brew not found' block
  echo "Installing Homebrew..."
  
  # 1. Define the known, trusted hash (This value must be correct and up-to-date)
  SHA256_HASH="2a7bfdb2a2e747ea60fc15cc7f128b4a9c3e2333f414c367abb6d6ebb45d3f4e"

  # Download the file
  curl -fsSL "https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh" -o "$FILE" \
    || { echo "*** File failed to download ***"; exit 1; }

  echo "Security Check (SHA-256 Hash)..."
  
  # 2. Calculate the actual hash of the downloaded file
  ACTUAL_HASH=$(shasum -a 256 "$FILE" | awk '{print $1}')

  # 3. Compare the hashes
  if [[ "$ACTUAL_HASH" != "$SHA256_HASH" ]]; then
    echo '*** Hash mismatch! Script might be compromised. ***'
    echo "Expected: $SHA256_HASH"
    echo "Actual:   $ACTUAL_HASH"
    exit 1
  else
    echo '*** Hash verified. File is authentic. ***'
  fi

  # User inspection and download conformation
  echo "File downloaded to: $FILE"
  echo "Open it in your editor and inspect it."
  echo "Example:    nano \"$FILE\""
  echo

  read -p "Have you manually inspected the script and approve running it? (y/n): " inspected
  if [[ $inspected != "y" ]]; then
    echo "Canceled."
    exit 0
  fi
  echo "Executing installer..."
  /bin/bash "$FILE"
fi

# Ensure brew is on PATH for both intel and apple silicon
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

echo "Updating brew..."
brew update

# Essentials
brew bundle --file Brewfile

echo "===== Bootstrap complete ====="