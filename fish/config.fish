#
#Kitty autocomplete
kitty + complete setup fish | source

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
		 echo "  [cleanup] <Clean and organize MacBook>"
	end
	if [ $r -lt 50 ]
		# upcoming, so prompt regularly
		set_color yellow
		 echo "  [misc] <Sell the freezer>"
	end

	# urgent, so prompt always
	set_color red
	 echo "  [sommelier] <implement cython and 3d plot>"

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
abbr cp "cp -i"
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
