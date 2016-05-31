BASH_PROFILE_CONF_DIR="$HOME/.bash_profile.d"

if [ ! -d "$BASH_PROFILE_CONF_DIR" ]; then
    # create the configuration directory
    mkdir "$BASH_PROFILE_CONF_DIR"
    chmod 700 "$BASH_PROFILE_CONF_DIR"

    # add a dummy file so the `ls` in the loop doesn't err out
    touch "$BASH_PROFILE_CONF_DIR/default"
fi

for profile_file in $BASH_PROFILE_CONF_DIR/*; do
    # shellcheck source=/dev/null
    source "$profile_file"
done


# shellcheck source=/dev/null
source ~/.bashrc

trap cleanup EXIT
