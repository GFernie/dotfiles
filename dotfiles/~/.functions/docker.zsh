# Functions to make docker easier to use

# Aliased to `dkmu`
__docker-machine_use() {
    if [ -z "$1" ]; then 1=default; fi
    if docker-machine ls | grep $1 > /dev/null; then
        docker-machine start $1
        docker-machine regenerate-certs --force $1
        eval "$(docker-machine env $1)"
    else
        echo "Host does not exist: $1"
    fi
}
