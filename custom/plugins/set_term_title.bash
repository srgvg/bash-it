if shopt -q login_shell && tty -s
then
  trap 'echo -ne "\033]2;[$(tty | cut -b 6-) ${PWD}] $(history 1 | sed "s/^[ ]*[0-9]*[ ]*//g") \007"' DEBUG
fi
