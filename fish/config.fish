#Kitty autocomplete
#kitty + complete setup fish | source

# vim = nvim 
alias vim="nvim"
alias vi="nvim"
alias oldvim="/usr/bin/vim" 

function ls
    exa -gh $argv
end

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

function fish_greeting
	echo
	echo -e (uname -r | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime | awk -F ',' '{print $1}' | uptime | awk -F ',' '{print $1}' | \
			awk '{ $1=""; print}' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo


	set r (random 0 100)
	if [ $r -lt 5 ] # only occasionally show backlog (5%)
		echo -e " \e[1mBacklog\e[0;32m"
		set_color blue
		echo "  [project] <description>"
		echo
	end

	set_color normal
	echo -e " \e[1mTODOs\e[0;32m"
	echo
	if [ $r -lt 10 ]
		# unimportant, so show rarely
		set_color cyan
		 echo "  [showr] <anixiety is like when video game combat music is playing but you can't find any enemies>"
	end
	if [ $r -lt 25 ]
		set_color green
		 echo "Create Firefox shortcut "
	end
	if [ $r -lt 50 ]
		# upcoming, so prompt regularly
		set_color yellow
		 echo "  [misc] <Sell the freezer>"
	end

	# urgent, so prompt always
	set_color red
	 echo "  [sommelier] <.py to jupyter and defend it>"

	echo

	if test -s ~/todo
		set_color magenta
		cat todo | sed 's/^/ /'
		echo
	end

	set_color normal
end

 # Autojump
if test -f /usr/share/autojump/autojump.fish;
	source /usr/share/autojump/autojump.fish;
end

#Vi binds test
fish_vi_key_bindings


# Aliases to protect against overwriting
# abbr cp "cp -i"
abbr mv "mv -i"

#some Git stuff
abbr g "git"
abbr gcl "git clone"
abbr ga 'git add -p'

# External monitor padding
abbr pad2 "yabai -m config --space 2 top_padding 160"

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

abbr sp "spotify"
 #cht.sh 
 abbr cht "cht.sh"

 #share text
 abbr txtshr "curl -F 'f:1=<-' ix.io | pbcopy"

#transfer files from terminal
function transfer --description 'Upload a file to transfer.sh'
    if [ $argv[1] ]
        # write to output to tmpfile because of progress bar
        set -l tmpfile ( mktemp -t transferXXX )
        curl --progress-bar --upload-file $argv[1] https://transfer.sh/(basename $argv[1]) >> $tmpfile
        cat $tmpfile
        command rm -f $tmpfile
    else
        echo 'usage: transfer FILE_TO_TRANSFER'
    end
end

#weather service https://github.com/chubin/wttr.in from terminal
abbr weather "curl -s 'wttr.in/?lang=ru&m'"

#speedtest
abbr speedtest "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - "

#Fuzzy search vim fzf
alias vif="nvim (fzf --height 40% --reverse)"


#Fisher bootstrap
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end


# ~/.config/fish/config.fish
starship init fish | source
