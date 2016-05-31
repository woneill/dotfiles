# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
    local IFS=':'
    local NEWPATH
    local DIR
    local PATHVARIABLE=${2:-PATH}
    for DIR in ${!PATHVARIABLE} ; do
        if [ "$DIR" != "$1" ] ; then
            NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
        fi
    done
    export ${PATHVARIABLE}="$NEWPATH"
}

pathprepend () {
    pathremove "$1" "$2"
    local PATHVARIABLE=${2:-PATH}
    export ${PATHVARIABLE}="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
    pathremove "$1" "$2"
    local PATHVARIABLE=${2:-PATH}
    export ${PATHVARIABLE}="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

export -f pathremove pathprepend pathappend

# Set the initial path
export PATH=/bin:/usr/bin

pathprepend ~/bin:/usr/local/bin

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

if [ -f "$HOME/Library/Python/2.7/bin/virtualenvwrapper.sh" ]; then
    # shellcheck source=/dev/null
    source "$HOME/Library/Python/2.7/bin/virtualenvwrapper.sh"
fi

shopt -s histappend
