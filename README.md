# Bill O'Neill's Dot Files

I'm using these sets of scripts to manage my environments. Currently it's oriented towards a Mac OS X based desktop but I plan on making these Linux server oriented too.

## Requirements

These will be installed via the [bootstrap](script/bootstrap) script if they're not already installed:

* [Gnu Stow](http://www.gnu.org/software/stow/) to maintain the symlinks for dot files
* [Homebrew](https://github.com/Homebrew/brew) for installing the Mac OS X dependencies
  * [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle) is used to bundle up all Mac OS X dependencies
  * [Homebrew Cask](https://github.com/caskroom/homebrew-cask) is used for installing desktop Mac applications
  * [mas-cli](https://github.com/argon/mas) is used for installing Mac App Store applications.

## Installation

Installation is based off of GitHub's [Scripts to Rule Them All](http://githubengineering.com/scripts-to-rule-them-all/) pattern.

### Initial installation
```
git clone https://github.com/woneill/dotfiles.git ~/dotfiles
cd ~/dotfiles
script/setup
```

### Update dependencies
```
cd ~/dotfiles
script/bootstrap
```

### Check for outdated/updated configs
```
cd ~/dotfiles
script/update
```

## Manual Steps
Some things aren't easily scripted or require outside dependencies. Open to ideas for automating these steps too!

### Install license for vmware fusion and vagrant plugin

```
vagrant plugin install vagrant-vmware-fusion
vagrant plugin license vagrant-vmware-fusion ~/license.lic
```

### Link in homebrew python to pyenv

```
ln -s $(brew --cellar python)/* /usr/local/var/pyenv/versions
ln -s $(brew --cellar python3)/* /usr/local/var/pyenv/versions
```

### Link in homebrew ruby to rbenv

```
ln -s $(brew --cellar ruby)/* /usr/local/var/rbenv/versions
```

### Install Docker for Mac
Follow instructions at [Docker for Mac](https://docs.docker.com/docker-for-mac/)