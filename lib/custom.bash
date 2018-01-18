# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## SSH Agent
#export SSH_ASKPASS=`which ssh-askpass`
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

#
## PATH #
#
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bins (bin secure) if it exists
if [ -d "$HOME/bins" ] ; then
    PATH="$HOME/bins:$PATH"
fi
# set PATH so it includes user's extra bin2 if it exists
if [ -d "$HOME/bin2" ] ; then
    if [ -d "$HOME/bin2/javabin" ] ; then
        PATH="$HOME/bin2:$HOME/bin2/javabin:$PATH"
    else
        PATH="$HOME/bin2:$PATH"
    fi
fi

# golang bin path
PATH="/usr/local/go/bin:$HOME/src/go/bin:$PATH"
# local pip and other thingz
PATH="$HOME/.local/bin:$PATH"
# ruby local path
#PATH="$PATH:$HOME/.gem/ruby/2.3.0/bin"

# sbin (Debian)
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"

export GOPATH=~/src/go/
export VISUAL=vim
export EDITOR=vim

export DEBFULLNAME="Serge van Ginderachter"
export DEBEMAIL="serge@vanginderachter.be"

# custom bash completions
if [ -d ~/.bash_completion.d ]
then
    for file in ~/.bash_completion.d/*
    do
        source $file
    done
fi

# quick package search
function dl() {
    dpkg -l | grep `for n in ${*:-^}; do echo -n " -e $n"; done`
    }

## make a dir and change to it - default in bash-it
#function mkcd () {
#	mkdir -v $1 && cd $1
#	}

# quick character count
function wcc() { echo "$*" | wc -c; }

# This will take you to the relevant part of the man page,
# so you can see the description of the switch underneath.
function manswitch () {
	man $1 | less -p "^ +$2";
	}

# Quickly CD Out Of n Directories
function up() {
	local x=''
	for i in $(seq ${1:-1})
	do 	x="$x../"
	done
	cd $x
	}



# switch ansible versions 1-2
function aswitch() {
    pushd ~/ansible
    currentrev=$(git describe --tags)
    if [[ $currentrev =~ .*v1.* ]]
    then
        git co v2.1.0.0-1
        git submodule update
        rm -rf v2/
        rm $(git ls-files --others)
    elif [[ $currentrev =~ .*v2.* ]]
    then
        git co v1.9.6-1
        git submodule update
        rm $(git ls-files --others)
    fi
    source hacking/env-setup >/dev/null 2>&1
    popd
}

function bitly() {
	$HOME/bins/bitly "${1:-}" | tr -d '\n' | tee >(xclip -in -selection clipboard)
}

# Avoid "Double quote to prevent globbing and word splitting."
export SHELLCHECK_OPTS='--shell=bash --exclude=SC2086'

source $HOME/etc/defaults

