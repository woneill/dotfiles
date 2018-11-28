HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd notify
bindkey -v

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update
else
  source ~/.zplug/init.zsh
fi

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
SPACESHIP_CHAR_SYMBOL=$
SPACESHIP_CHAR_SUFFIX=' ' 
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_VI_MODE_SHOW=false

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    zplug install
fi

zplug load

#zstyle :compinstall filename '/Users/woneill/.zshrc'

#autoload -Uz compinit
#compinit

fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions $fpath)
