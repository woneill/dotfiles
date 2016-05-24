PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"
RUBYOPT="-rubygems"
#export PROMPT_COMMAND="history -a; history -n"

# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# virtualenvwrapper config
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/Library/Python/2.7/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_CLONE=$HOME/Library/Python/2.7/bin/virtualenv-clone

source $HOME/Library/Python/2.7/bin/virtualenvwrapper.sh

shopt -s histappend

eval "$(direnv hook bash)"

# Increase API limit for brew
if [ -f ~/.HOMEBREW_GITHUB_API_TOKEN ]; then
    source ~/.HOMEBREW_GITHUB_API_TOKEN
fi
