source $HOME/.config/fish/conf.d/environment.fish
fish_add_path ~/.local/bin
set -g fish_greeting

if status --is-login
    echo "Welcome back, $USER!"
	if [ "$(tty)" = "/dev/tty1" ]
  		exec niri-session -l
	end
end

if status is-interactive
    keychain --eval --quiet --noask id_ed25519 | source
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

# pnpm
set -gx PNPM_HOME "/home/tinbolw/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
