docker_remote() {
    if [ -n "${PRIVATE_DOCKER_HOST}" ]; then
        export DOCKER_HOST="${PRIVATE_DOCKER_HOST}"
    fi

    export DOCKER_TLS_VERIFY=1
}

docker_local() {
    export -n DOCKER_HOST
    export -n DOCKER_TLS_VERIFY
}

export -f docker_remote docker_local
