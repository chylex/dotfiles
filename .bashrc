alias lsa='ls -l -v --all --human-readable --color=auto'
alias gh='history|grep'

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h \[\033[01;33m\]\w \[\033[01;35m\]\$ \[\033[00m\]'
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
