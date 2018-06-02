#
## PATH #
#

# sbin (Debian)
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"

## set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]
then
  PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bins (bin secure) if it exists
if [ -d "$HOME/bins" ]
then
  PATH="$HOME/bins:$PATH"
fi
# set PATH so it includes user's extra bin2 if it exists
if [ -d "$HOME/bin2" ]
then
  if [ -d "$HOME/bin2/javabin" ]
  then
    PATH="$HOME/bin2/javabin:$PATH"
  fi
  PATH="$HOME/bin2:$PATH"
fi

## golang bin path
if [ -d /usr/local/go/bin ]
then
  PATH="/usr/local/go/bin:$PATH"
fi
if [ -d "$HOME/go/bin" ]
then
  PATH="$HOME/go/bin:$PATH"
fi

## local pip and other thingz
if [ -d $HOME/.local/bin ]
then
  PATH="$HOME/.local/bin:$PATH"
fi

