alias ahack='source ~/ansible/hacking/env-setup >/dev/null 2>&1'
alias ai='sudo apt install'
alias ansible-hostvars='ansible -m debug -a var=hostvars[inventory_hostname]'
alias as='apt-cache search'
alias ash='apt-cache show'
alias ap='apt-cache policy'
alias aud='sudo apt update && apt list --upgradable -a'
alias aug='sudo apt -y upgrade'
alias auf='sudo apt -y full-upgrade && sudo apt -y autoremove'
alias bi="bash-it"
alias copy='xclip -in -selection c'
alias diff='diff -u'
alias dL='dpkg -L'
alias ecryptmount="sudo mount -t ecryptfs -o ecryptfs_enable_filename_crypto=yes"
alias ga='git add'
alias gA='git add --all'
alias gap='git add --patch'
alias gdc='git diff --cached'
alias gd='git diff'
alias gdpaste="git diff | grep -v -e diff -e ^index -e '---' -e @@"
alias gds='git dfs'
alias gi='git myinfo'
alias gl='git lola'
alias gls='git lol'
alias gld='git lold'
alias gsmu='git submodule update'
alias gt='git show-tree'
alias gu='git up'
alias imginfo="identify -format '-- %f -- \nType: %m\nSize: %b bytes\nResolution: %wpx x %hpx\nColors: %k'"
alias imgres="identify -format '%f: %wpx x %hpx\n'"
alias k="keybase"
alias li3='launch-screen i3jobs'
alias l='ls -lh'
alias locateh="locate --all --existing --follow --ignore-case /home/serge"
alias o='gnome-open'
alias paste='xclip -out -selection c'
alias ping1="ping -c 1 "
alias ping3="ping -c 3 "
alias poweroff="sudo poweroff"
alias poweroff='sudo /sbin/poweroff'
alias psless="ps auxwwf | less"
alias r='ranger'
alias shredit='shred --verbose --iterations 5 --zero --remove'
alias sjah="echo -n '¯\_(ツ)_/¯' | xclip -in -selection clipboard && paste"
alias sshnc="ssh -S none"
alias sshnokey="ssh -o PubkeyAuthentication=no"
alias sshpw="ssh -o ControlPath=none -o PreferredAuthentications=password"
alias svn-addall='svn add `svn status | grep ? | cut -d\  -f2- | xargs`'
alias swappy="/sbin/sysctl vm.swappiness"
alias sysl="less /var/log/syslog"
alias terminal="/usr/bin/xfce4-terminal --disable-server"
alias vs="vcsh status"
alias v="vcsh"

unalias grv
