# Contributing to **Mac_Bootstrap**

Contributions should move the project toward these three principles:

- **Safe** (no risky blind installs)
- **Selective** (users don’t have to install everything)
- **Repeatable** (you can re-run after 2 months and not worry)

## Download & Inspect
Download the script first using:
```bash  
curl -O https://example.com/install.sh
```
Then inspect its contents using a text editor, and only then execute it if it appears safe.

## Optional Flags
make the script configurable without editing it.

Examples:
```bash 
./bootstrap.sh --minimal     # core CLI tools only
./bootstrap.sh --full-dev    # GUI apps + IDEs + browsers
./bootstrap.sh --webdev      # (possible future pack)
./bootstrap.sh --ai-dev      # (possible future pack)
```
## Robust Idempotency
To fulfill the "Repeatable" core principle, the script must implement mandatory checks:
- Pre-check Installations: All package installations must be wrapped in functions that verify if the package is already installed before attempting installation (e.g., checks before brew install).
- Prevent Duplication: Logic must be in place to skip duplicate brew tap commands.
- Configuration Protection: The script must not overwrite existing user configuration files (e.g., .zshrc, .gitconfig) without explicit, interactive confirmation.
- Helper Functions: Utilize small, focused helper functions (like is_installed()) to manage these checks cleanly.

## Better Error Handling & Safety Checks
script should fail loudly, clearly, and safely.

- **Pre-flight** Checks: Implement critical safety checks before installation begins:
  - network connection checks before downloads
  - verify Homebrew installed first
  - verify Rosetta installed on Apple Silicon (if needed)
  
- **Loud Failure**: The script must fail loudly and clearly upon error. Replace raw Bash output with human-readable success/fail messages that state what failed and provide actionable advice.



