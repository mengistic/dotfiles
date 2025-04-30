

autoload -U colors && colors
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
#set -o vi
compinit
_comp_options+=(globdots)



#PS1="󰘍└→%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}% "
#
PS1="
[%F{blue}%3C%f]
→ \
"


lfcd() {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}

# bash/any POSIX shell

z() {
	result="$(zoxide query --exclude $PWD "$@")"
	lf -remote "send $id cd '$result'"
}

zi() {
	result="$(zoxide query -i)"
	lf -remote "send $id cd '$result'"
}

on-cd() {
        zoxide add "$PWD"
}

[ -f "$HOME/.config/zsh/alias.zsh" ] && source "$HOME/.config/zsh/alias.zsh"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


eval "$(zoxide init --cmd cd zsh)"
