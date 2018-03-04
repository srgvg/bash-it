#!/bin/bash
# c-basic-offset: 4; tab-width: 4; indent-tabs-mode: t
# vi: set shiftwidth=4 tabstop=4 noexpandtab:
# :indentSize=4:tabSize=4:noTabs=false:

function apk() {
	# show extended package information
	# shellcheck disable=SC2048
	apt-cache policy $*
	# shellcheck disable=SC2048
	apt-cache policy $*
	# shellcheck disable=SC2048
	apt-cache showpkg $*
}

function aswitch() {
	# switch ansible versions 1-2
	pushd ~/ansible
	currentrev=$(git describe --tags)
	if [[ $currentrev =~ .*v1.* ]]
	then
		git co v2.1.0.0-1
		git submodule update
		rm -rf v2/
		# shellcheck disable=SC2046
		rm $(git ls-files --others)
	elif [[ $currentrev =~ .*v2.* ]]
	then
		git co v1.9.6-1
		git submodule update
		# shellcheck disable=SC2046
		rm $(git ls-files --others)
	fi
	# shellcheck disable=SC1091
	source hacking/env-setup >/dev/null 2>&1
	popd
}

function bitlys() {
	convert an url to my bitly shorturl
	# shellcheck disable=SC2046
	$HOME/bin/bitly "${1:-}" | tr -d '\n' | tee >(xclip -in -selection clipboard)
}

function dl() {
	# quick package search
	# shellcheck disable=SC2046
	dpkg -l | grep $(for n in ${*:-^}; do echo -n " -e $n"; done)
}

function manswitch() {
  # This will take you to the relevant part of the man page,
  # so you can see the description of the switch underneath.
  man $1 | less -p "^ +$2";
}

function i3-launch-job() {
	if [ -z "$*" ]
	then
		echo "Nothing to launch"
		return
	fi
	echo; echo -n "Checking for \"$*\" ... "
	if pgrep -f "$*"
	then
		echo Already running.
	else
		# shellcheck disable=SC2048
		launch-screen i3jobs add $*
	fi
	echo; echo "----------------------------------------"
}

function i3-reconnect-i3jobs() {
	screen -D -r i3jobs
}

function up() {
	# Quickly CD Out Of n Directories
	local x=''
	# shellcheck disable=SC2034
	for i in $(seq ${1:-1})
	do	x="$x../"
		done
	# shellcheck disable=SC2164
	cd $x
}

function vim-debuglog() {
	# shellcheck disable=SC2048
	vi -V9$HOME/logs/scripts/VIMDEBUG.LOG $*
}

function wcc() {
  # quick character count
  local string="${*}"
  echo "${#string}"
}

