# Bill O'Neill's Dot Files

I'm using these sets of scripts to manage my environments. They can be used to configure OSX, Linux, and Android.

## Pre-requisites

Everything is managed via [chezmoi](https://github.com/twpayne/chezmoi) so installing it is the first step. Follow the [chezmoi install guide](https://github.com/twpayne/chezmoi/blob/master/docs/INSTALL.md).

### OSX

These will be installed via the [run_once_install-packages.sh.tmpl](run_once_install-packages.sh.tmpl) script if they're not already installed:

* [Homebrew](https://github.com/Homebrew/brew) for installing the Mac OS X dependencies
  * [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) is used to bundle up all Mac OS X dependencies
  * [Homebrew Cask](https://github.com/caskroom/homebrew-cask) is used for installing desktop Mac applications
* [mas-cli](https://github.com/argon/mas) is used for installing Mac App Store applications.
* Xcode

### Linux

No pre-requisites

### Android

* [Termux](https://play.google.com/store/apps/details?id=com.termux): an Android terminal emulator and Linux environment application that works directly with no rooting or setup required

## Usage

### Initial installation
```
chezmoi init --apply --verbose https://github.com/woneill/dotfiles.git
```

### Update from repo
```
chezmoi update
```

### Check for unmanaged files
```
chezmoi unmanaged
```

### Add new files or Edit existing files
```
# Add an existing file
chezmoi add <path_to_file>

# Edit a file already managed
chezmoi edit <path_to_file>

# Compare with current
chezmoi diff

# Apply the changes
chezmoi -v apply

# Commit updates to github
## Spawn shell in chezmoi directory
chezmoi cd
## Add new or changed files
git add -A
git commit -m "<commit message>"
git push
## Exit from spawned shell
exit
```