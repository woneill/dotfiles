#!/usr/bin/env zsh
command -v asdf >/dev/null 2>&1 && {
    expected_plugins=(direnv helm helmfile java kubectl maven nodejs python ruby terraform terraform-docs terraformer tflint tfsec)
    typeset -A a2
    for k in $(asdf plugin list); do
        a2[$k]=1
    done
    for k in $expected_plugins; do
        if [ ! "${a2[$k]}" ]; then
            asdf plugin add $k
        fi
    done
}
