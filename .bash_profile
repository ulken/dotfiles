# Use US English UTF-8 for international characters like åäö to work in terminal
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# Avoid duplicate entries
export HISTCONTROL=erasedups:ignoreboth

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# Colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"

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
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# `**/qux` will enter `./foo/bar/baz/qux`
shopt -s autocd 2> /dev/null
# Recursive globbing, e.g. `echo **/*.txt`
shopt -s globstar 2> /dev/null
# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
# Do not overwrite files when redirecting using ">". Note that you can still override this with ">|"
set -o noclobber
# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars
# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Bash completion
command -v brew >/dev/null 2>&1 && [ -r "$(brew --prefix)/etc/bash_completion" ] && source "$(brew --prefix)/etc/bash_completion"

# Default editor
export EDITOR="nvim"

# Colorful ls
export CLICOLOR=1

# Automatically trim long paths in the prompt
export PROMPT_DIRTRIM=2

# Define cd targets
# Add the directories you want to have fast access to, separated by colon
CDPATH=".:~:~/dev"

export dropbox="~/Dropbox"
export dev="~/dev"

# Less/man pages
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

for file in ~/.bash_{prompt,aliases,functions,git}; do
	[ -r "$file" ] && source "$file"
done
