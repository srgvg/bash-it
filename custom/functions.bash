
function apk() {
  # show extended package information
  apt-cache policy $*; apt-cache showpkg $*
}


function aswitch() {
  # switch ansible versions 1-2
  pushd ~/ansible
  currentrev=$(git describe --tags)
  if [[ $currentrev =~ .*v1.* ]]
  then
    ¦ git co v2.1.0.0-1
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
  # convert an url to my bitly shorturl
  $HOME/bins/bitly "${1:-}" | tr -d '\n' | tee >(xclip -in -selection clipboard)
}


function dl() {
  # quick package search
    dpkg -l | grep `for n in ${*:-^}; do echo -n " -e $n"; done`
}


function manswitch() {
  # This will take you to the relevant part of the man page,
  # so you can see the description of the switch underneath.
  man $1 | less -p "^ +$2";
}


# pyenv
function pyenv-init() {
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1
    then
        eval "$(pyenv init -)"
    fi
    eval "$(pyenv virtualenv-init -)"
}


function up() {
  # Quickly CD Out Of n Directories
  local x=''
  for i in $(seq ${1:-1})
  do  x="$x../"
  done
  cd $x
}


function wcc() {
  # quick character count
  echo "$*" | wc -c
}


