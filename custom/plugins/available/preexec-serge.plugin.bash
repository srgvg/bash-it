cite about-plugin
about-plugin 'log an extended bash history'

# https://spin.atomicobject.com/2016/05/28/log-bash-history/
if [ ! -d $HOME/logs/bash_history ]
then
  mkdir -p $HOME/logs/bash_history/$(date "+%Y")/$(date "+%m")/
fi

function preexec_serge_install () {

    function precmd () {

      echo "$(date "+%Y-%m-%d.%H:%M:%S") ${BASHPID}/$(history 1) [$(pwd)]" \
      >> $HOME/logs/bash_history/$(date "+%Y")/$(date "+%m")/$(date "+%Y%m%d")-$(hostname).log

    }

    preexec_install
}

preexec_serge_install

