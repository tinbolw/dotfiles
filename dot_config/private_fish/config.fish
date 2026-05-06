source $HOME/.config/fish/conf.d/environment.fish
fish_add_path ~/.local/bin
set -g fish_greeting

if status --is-login
    echo "Welcome back, $USER!"
	if [ "$(tty)" = "/dev/tty1" ]
  		exec niri-session -l
	end
end

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

zoxide init fish | source
