# Set the initial path
export PATH=~/bin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin

BASH_PROFILE_CONF_DIR="$HOME/.bash_profile.d"

if [ ! -d "$BASH_PROFILE_CONF_DIR" ]; then
    # create the configuration directory
    # shellcheck disable=SC2174
    mkdir -p -m 700 "$BASH_PROFILE_CONF_DIR"
fi


for profile_file in $BASH_PROFILE_CONF_DIR/*; do
    if [ -f "$profile_file" ]; then
        # shellcheck source=/dev/null
        source "$profile_file"
    fi
done

# shellcheck source=./.bashrc
source "$HOME/.bashrc"
