#!/usr/bin/env bash

# colored grep
alias grep='grep --color=auto'
export GREP_COLOR='1;33'

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

if [[ -z "$CUSTOM_THEME_DIR" ]]; then
    CUSTOM_THEME_DIR="${BASH_IT_CUSTOM:=${BASH_IT}/custom}/themes"
fi

# Load the theme
if [[ $BASH_IT_THEME ]]; then
    if [[ -f "$CUSTOM_THEME_DIR/$BASH_IT_THEME/$BASH_IT_THEME.theme.bash" ]]; then
        source "$CUSTOM_THEME_DIR/$BASH_IT_THEME/$BASH_IT_THEME.theme.bash"
    else
        source "$BASH_IT/themes/$BASH_IT_THEME/$BASH_IT_THEME.theme.bash"
    fi
fi

# https://spin.atomicobject.com/2016/05/28/log-bash-history/
[ -d ~/logs/bash_history ] && \
  export PROMPT_COMMAND='echo "$(date "+%Y-%m-%d.%H:%M:%S") ${BASHPID}/$(history 1) [$(pwd)]" >> ~/logs/bash_history/$(date "+%Y")/$(date "+%m")/$(date "+%Y%m%d")-$(hostname).log '";${PROMPT_COMMAND}"
