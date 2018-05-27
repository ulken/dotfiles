# Override builtin cd to list files also
function cd() { builtin cd "$@" && ls; }

# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}

# Extract archives of various types
function extract() {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)  tar xjf           $1 ;;
			*.tar.gz)   tar xzf           $1 ;;
			*.tar.xz)   tar Jxvf          $1 ;;
			*.tar)      tar xf            $1 ;;
			*.tbz2)     tar xjf           $1 ;;
			*.tgz)      tar xzf           $1 ;;
			*.bz2)      bunzip2           $1 ;;
			*.rar)      unrar x           $1 $2 ;;
			*.gz)       gunzip            $1 ;;
			*.zip)      unzip -d ${1%.*}  $1 ;;
			*.Z)        uncompress        $1 ;;
			*)          echo "'$1' not supported" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Copy public SSH key to clipboard (generate if missing)
function ssh-key() {
	local file="~/.ssh/id_rsa.pub"
	if [ ! -f "$file" ]; then
		ssh-keygen -t rsa -b 4096 -C `git config --global user.email`
	fi
	pbcopy < "$file"
}