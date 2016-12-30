docker_remote() {
    if [ -n "${PRIVATE_DOCKER_HOST}" ]; then
        export DOCKER_HOST="${PRIVATE_DOCKER_HOST}"
    fi

    if [ -n "${PRIVATE_DOCKER_API_VERSION}" ]; then
        export DOCKER_API_VERSION="${PRIVATE_DOCKER_API_VERSION}"
    fi

    export DOCKER_TLS_VERIFY=1
}

docker_local() {
    export -n DOCKER_HOST
    export -n DOCKER_TLS_VERIFY
    export -n DOCKER_API_VERSION
}

export -f docker_remote docker_local
