
## SSH Agent
if [   X$HOSTNAME = Xgoldorak \
    -o X$HOSTNAME = Xminos \
    -o X$HOSTNAME = Xcyberlab ]
then
    # re-use keychain agents if available
    if [ -f ~/.keychain/${HOSTNAME}-sh ]; then
    	source ~/.keychain/${HOSTNAME}-sh
    fi

    shopt -s extglob
    [ -x `which keychain` ]  && \
    [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] || \
        eval `keychain --lockwait 300 --quiet \
        --inherit any --nogui \
        --agents ssh,gpg \
        --eval ~/.ssh/keys/default/!(*.pub)`
    shopt -u extglob
fi

