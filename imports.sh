export DEBIAN_FRONTEND=noninteractive

export BASEDIR=$(dirname "$0")

alias package='sudo apt-get --quiet --quiet --yes'
alias service='sudo systemctl --quiet'
