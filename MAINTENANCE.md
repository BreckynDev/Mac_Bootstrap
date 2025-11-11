# Maintenance Notes

This document explains what must be kept updated for this repository and how to verify it.

---

## Items That Require Regular Updates

| Item | What It Is | Where To Find Current Value | Update Frequency |
|------|------------|-----------------------------|-----------------|
| Homebrew installer SHA256 hash | Used to verify the official Homebrew install script we fetch remotely | https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh — compute hash locally using `shasum -a 256` | Monthly, or when install.sh changes |
| Package list in install script | The list of tools/packages to install on a new machine | Whatever tools you personally use on your development machine | Whenever you add a new tool or dependency |
| Required macOS versions / dependencies | Minimum OS level or required system frameworks | Apple docs + Homebrew docs | When new macOS releases come out |

---

## How to Refresh The Homebrew install.sh SHA256 Hash

1. Download latest script fresh:

```bash
curl -L -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
```

2. Compute hash:

shasum -a 256 install.sh