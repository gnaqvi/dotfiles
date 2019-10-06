#
# Fish specific
#

# Quite!
set fish_greeting ""

# Prompt
eval (starship init fish)

# Colors
if status --is-interactive
	set BASE16_SHELL "$HOME/.config/base16-shell/"
	source "$BASE16_SHELL/profile_helper.fish"
	base16-ocean
end

if test -x /usr/bin/dircolors -a -e ~/.dircolorsrc
	eval (dircolors -c ~/.dircolorsrc | sed 's/>&\/dev\/null$//')
end

# Install fisher
if not functions -q fisher
	set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
	curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
	fish -c fisher
end

#
# Environment
#

# Default apps
set -gx BROWSER /usr/bin/google-chrome-stable
set -gx EDITOR /usr/bin/code

# Local bin directory
set -gx PATH $HOME/.local/bin $PATH

# Config directory
set -gx XDG_CONFIG_HOME $HOME/.config

#
# Aliases
#

# Modified commands
alias diff "colordiff"
alias grep "grep --color=auto"
alias more "less"
alias df "df -h"
alias du "du -c -h"
alias mkdir "mkdir -p -v"
alias nano "nano -w"
alias ping "ping -c 5"
alias dmesg "dmesg -HL"
alias ccat "pygmentize -g"

# ls
alias ls "ls -hF --color=auto"
alias lr "ls -R" # recursive ls
alias ll "ls -l"
alias la "ll -A"
alias lx "ll -BX" # sort by extension
alias lz "ll -rS" # sort by size
alias lt "ll -rt" # sort by date
alias lm "la | more"

# Safety features
alias cp "cp -i"
alias mv "mv -i"
alias rm "rm -I" # 'rm -i' prompts for every file
alias ln "ln -i"
alias chown "chown --preserve-root"
alias chmod "chmod --preserve-root"
alias chgrp "chgrp --preserve-root"

# Pacman
alias pru "sudo pacman -Rns (pacman -Qtdq)"
alias pkgl "pacman -Qqe > ~/.pkglist" # updates package list

#
# Dev
#

# node
if functions -q bass
	bass export NVM_DIR="$HOME/.nvm"
	bass export NVM_SOURCE="/usr/share/nvm"
	function nvm
		bass source /usr/share/nvm/nvm.sh --no-use ';' nvm $argv
	end
end

# Go
set -gx GOROOT /usr/lib/go
set -gx GO111MODULE on
set -gx GOPATH ~/Dev/go