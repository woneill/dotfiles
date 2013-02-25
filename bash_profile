alias vi=vim

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

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi
