# https://spin.atomicobject.com/2016/05/28/log-bash-history/

function precmd () {
  location="$HOME/logs/bash_history/$(date "+%Y")/$(date "+%m")/"
  mkdir -p $location
  echo "$(date "+%Y-%m-%d.%H:%M:%S") ${BASHPID}/$(history 1) [$(pwd)]" \
  >> ${location}/$(date "+%Y%m%d")-$(hostname).log
}
preexec_install

