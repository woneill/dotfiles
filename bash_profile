alias vi=vim
alias sed=gsed

# Wrap git automatically by adding the following to ~/.bash_profile:

eval "$(hub alias -s)"

json_get() {
  curl -s -X GET -H "Content-Type: application/json" $1 | python -mjson.tool
}

json_put() {
  curl -s -X PUT -H "Content-Type: application/json" $1 -d $2
}

json_post() {
  curl -s -X POST -H "Content-Type: application/json" $1 -d $2
}

source ~/.bashrc

if [ -f ~/.bash_profile.$(uname -s) ]; then
    source ~/.bash_profile.$(uname -s)
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ~/.bash_profile.work ]; then
    source ~/.bash_profile.work
fi
