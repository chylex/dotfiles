bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias gh='history|grep'
alias less='less --mouse'
alias lsa='ls -l -v --all --human-readable --group-directories-first --color=auto'

alias d='docker'
alias dc='docker compose'
alias dcud='docker compose up -d'
alias dcul='docker compose up -d && docker compose logs -f'

function dupdate() { docker compose build --pull && docker compose pull && docker compose up -d; }
function dprune() { docker system prune --all --volumes --force; }

function dlogs() { docker logs $1 2>&1; }
function ddebug() { docker run --rm -it --entrypoint "/bin/$2" "$1"; }
function dbash() { docker exec -it "$1" /bin/bash; }
function dsh() { docker exec -it "$1" /bin/sh; }

function dname() { docker ps -af "id=$1" --format '{{.Image}}' | tail -n -1; }
function dtop() { docker top $1 axo user:30,pid,pcpu,pmem,vsz,rss,tty,stat,start,time,comm; }
function dtopall() { for c in $(docker ps -q); do docker inspect $c -f "{{ .Name }}:"; docker top $c axo user:30,pid,comm | tail -n +2; echo "--------------"; done; }
function dsubnets() { docker network inspect $(docker network ls | awk '$3 == "bridge" { print $1 }') | jq -r '.[] | .Name + " " + .IPAM.Config[0].Subnet' -; }
function dmemlimit() { docker stats --no-stream --format "{{.MemUsage}}" | awk '{print $3}' | sort | sed 's/.$//' | numfmt --from=iec-i | awk '{s+=$1} END {printf "%.0f\n", s}' | numfmt --to=iec --format="%.3f"; }

function borgsize() { printf 'Archive\t\t\tOrig\tComp\tDedup\n'; printf '%-16.16s\t%s\t%s\t%s\n' $(borg info --json --sort-by name --glob-archives '*' "$1" | jq '.archives[] | "\(.name) \(.stats.original_size) \(.stats.compressed_size) \(.stats.deduplicated_size)"' | sed --expression='s/^"//;s/"$//' | numfmt --field='2-4' --to=iec); }

export EDITOR=vim

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h \[\033[01;33m\]\w \[\033[01;35m\]\$ \[\033[00m\]'
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

if [ -x /usr/bin/tmux ] && [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux new -A
fi
