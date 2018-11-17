#
## PATH #
#

# add sbin paths (not default in Debian)
pathmunge /usr/local/sbin:/usr/sbin:/sbin


## set PATH so it includes various user's private bin dirs
GOBINPATH="${GOPATH//://bin:}/bin"
gobinpath="${GOBINPATH/$HOME\/}"

_binpaths="${gobinpath} bin bins bin2"
_bin2paths="$(cd $HOME; find bin2/ -mindepth 1 -maxdepth 1  -type d 2>/dev/null | sort -r | xargs)"
[ -n "${_bin2paths}" ] && _binpaths="${_binpaths} ${_bin2paths}"
_binpaths="$_binpaths .local/bin"
unset _bin2paths

for _p in ${_binpaths}
do
  if [ -d "$HOME/$_p" ]
  then
    pathmunge "$HOME/$_p"
  fi
done

unset _binpaths
unset _p
