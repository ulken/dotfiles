# Avoid duplicate entries
export HISTCONTROL=ignoreboth:erasedups

export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# Append to history file
shopt -s histappend
# Update LINES and COLUMNS after each command
shopt -s checkwinsize
# Autocorrect typos in path names when using `cd`
shopt -s cdspell
# Save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
# Do not autocomplete when pressing Tab on an empty line
shopt -s no_empty_cmd_completion

# Do not overwrite files when redirecting using ">". Note that you can still override this with ">|"
set -o noclobber

# `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Load prompt and aliases
for file in ~/.bash_{prompt,aliases,functions,git}; do
	[ -r "$file" ] && source "$file"
done

# Bash completion
command -v brew >/dev/null 2>&1 && [ -r "$(brew --prefix)/etc/bash_completion" ] && source "$(brew --prefix)/etc/bash_completion"

export EDITOR="nvim"

# Colorful ls
export CLICOLOR=1

less_options=(
	# If the entire text fits on one screen, show it and quit
	--quit-if-one-screen

	# Do not clear the screen
	--no-init

	# Like "smartcase" in Vim: ignore case unless the search pattern is mixed
	--ignore-case

	# Do not automatically wrap long lines
	--chop-long-lines

	# Allow ANSI colour escapes, but no other escapes
	--RAW-CONTROL-CHARS

	# Do not ring the bell when trying to scroll past the end of the buffer
	--quiet

	# Do not complain when we are on a dumb terminal
	--dumb
);
export LESS="${less_options[*]}"
unset less_options
# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"
export PAGER="less"
export MANPAGER="less"