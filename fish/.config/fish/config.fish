if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Abbreviations
abbr -a cl clear
abbr -a l ll -a
abbr -a gco git checkout
abbr -a gp git push
abbr -a lg lazygit
abbr -a n nvim
abbr -a p python
abbr -a c claude
abbr -a es "cd ~/esim; source .venv/bin/activate.fish"
abbr -a re "python src/main.py &; sleep 0.5; hyprctl dispatch setfloating; hyprctl dispatch resizeactive exact 1920 1080; hyprctl dispatch centerwindow"

# Initialize starship
starship init fish | source

# Initialize zoxide
zoxide init fish | source

# Yazi shell wrapper (to use "y" and change current working directory when exiting)
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# Environment variables
set -gx EDITOR nvim
