export _LOG_LEVEL='debug'

export PATH="${PATH}:~/.local/bin"

for _MODULE in ~/.config/wertable/* ; do
  if [ -d ~/.config/wertable/${_MODULE}/lib ]; then
    for _FILE in ~/.config/wertable/${_MODULE}/lib* ; do
      . ${_FILE}
    done
  fi
  if [ -d ~/.config/wertable/${_MODULE}/bin ] ; then
    chmod +x ~/.config/wertable/${_MODULE}/bin/*
    export PATH="${PATH}:~/.config/wertable/${_MODULE}/bin"
  fi
done

# initial system configuration
if [ ! -f /tmp/wertable_init.log ]; then
    echo "New installation detected <$(date '+%Y-%m-%d %H:%M:%S')>, running <_init --unattended> script"
    VERBOSE= _init --unattended &>> /tmp/wertable_init.log
    echo "#### script <_init> finished with: $?" >> /tmp/wertable_init.log
fi

# define shell type
script_execution() {
    set -Eeu
    [ ${VERBOSE+x} ] && set -x || true
    [ ${DEBUG+x} ] && export _LOG_LEVEL='debug' || true
    [ ${QUIET+x} ] && export _LOG_LEVEL='error' || true
}
case $- in
    *i*) set +Eeu                 ;; # interactive shell
      *) script_execution  "${@}" ;;
esac

# ensure wertable state
if [ ! -f ~/.wertable_state ]; then
    _wertable_state
fi
. ~/.wertable_state
