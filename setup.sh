#!/usr/bin/env bash

OS="$(uname -s)"
UNAME_MACHINE="$(uname -m)"

if [ "${UNAME_MACHINE}" == "arm64" ]; then
    # On ARM macOS, this script installs to /opt/homebrew only
    HOMEBREW_PREFIX="/opt/homebrew"
else
    # On Intel macOS, this script installs to /usr/local only
    HOMEBREW_PREFIX="/usr/local"
fi

if [ "${OS}" == "Darwin" ]; then
    # Are Xcode CLI tools installed?
    xcode-select -p &>/dev/null || {
        echo "==> Installing Xcode CLI tools…"
        xcode-select --install
        sudo xcodebuild -license
    }

    # Is homebrew installed?
    command -v brew &>/dev/null || {
        echo "==> Installing homebrew…"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "(${HOMEBREW_PREFIX}/bin/brew shellenv)"
    }

    # Ensure that chezmoi, mas and 1password-cli are installed
    # Tabs, not spaces for these lines, else the heredoc will break!
    brew bundle --file=- <<-EOS
		brew "chezmoi"
		brew "mas"
		cask "1password-cli"
	EOS

elif [ "$OS" == "android" ]; then
    if [ -f "${HOME}/.termux.pkglist" ]; then
        echo "==> Installing termux dependencies…"
        xargs -0 apt install -y < <(tr \\n \\0 <"${HOME}"/.termux.pkglist)
    fi

    # TODO: Look into oh-my-termux from https://wiki.termux.com/wiki/ZSH
    pkg install zsh
    chsh -s zsh
else
    echo "Unknown OS $OS"
    exit 1
fi

if [ ! -d "${HOME}/.local/share/chezmoi" ]; then
    chezmoi init --apply --verbose https://github.com/woneill/dotfiles.git
fi
