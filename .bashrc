# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors
if [ -x /usr/bin/dircolors ]; then
	[ -r ~/.dircolorsrc ] && eval "$(dircolors -b ~/.dircolorsrc)" || eval "$(dircolors -b)"
fi

# System
systemctl --user import-environment PATH

function usbinfo() {
	for i in $(find /sys/devices -name "bMaxPower")
	do
		busdir=${i%/*}
		busnum=$(<$busdir/busnum)
		devnum=$(<$busdir/devnum)
		title=$(lsusb -s $busnum:$devnum)

		printf "\n\n+++ %s\n  -%s\n" "$title" "$busdir"

		for ff in $(find $busdir/power -type f ! -empty 2>/dev/null)
		do
			v=$(cat $ff 2>/dev/null|tr -d "\n")
			[[ ${#v} -gt 0 ]] && echo -e " ${ff##*/}=$v";
			v=;
		done | sort -g;
	done;

	printf "\n\n\n+++ %s\n" "Kernel Modules"
	for mod in $(lspci -k | sed -n '/in use:/s,^.*: ,,p' | sort -u)
	do
		echo "+ $mod";
		systool -v -m $mod 2> /dev/null | sed -n "/Parameters:/,/^$/p";
	done
}

# Environment
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/code

#
# Aliases
#

# Modified commands
alias xcp='xclip -selection clipboard'
alias diff='colordiff' # requires colordiff package
alias grep='grep --color=auto'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias dmesg='dmesg -HL'

# ls
alias ls='ls -hF --color=auto'
alias lr='ls -R' # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX' # sort by extension
alias lz='ll -rS' # sort by size
alias lt='ll -rt' # sort by date
alias lm='la | more'

# Safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I' # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Pacman
alias pacrm='sudo pacman -Rns (pacman -Qtdq)'
alias pacnew='find /etc -regextype posix-extended -regex ".+\.pac(new|save)" 2> /dev/null'
alias pkgl='pacman -Qqe > ~/.pkglist'

#
# Dev
#

# node
source /usr/share/nvm/init-nvm.sh

# go
export GOROOT=/usr/lib/go
export GO111MODULE=on
export GOPATH=~/Dev/go
