#Kitty autocomplete
#kitty + complete setup fish | source

# vim = nvim 
alias vim="nvim"
alias vi="nvim"
alias oldvim="/usr/bin/vim" 

fish_vi_key_bindings

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

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

function fish_greeting
	echo
	echo -e (uname -r | awk '{print " \\\\e[1mOS: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uptime | awk -F ',' '{print $1}' | uptime | awk -F ',' '{print $1}' | \
			awk '{ $1=""; print}' | awk '{print " \\\\e[1mUptime: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[0;32m"$0"\\\\e[0m"}')
	echo
end




 # Autojump
begin
    set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
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
abbr wtr "curl -s 'wttr.in/?lang=ru&m'"

#speedtest
abbr speedtest "curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python - "

#Fuzzy search vim fzf
alias vif="nvim (fzf --height 40% --reverse)"

#common missclick
alias vmi="vim"


#Fisher bootstrap
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end


# ~/.config/fish/config.fish
#starship init fish | source

#Magit commit

# contains $HOME/.fig/bin $fish_user_paths; or set -Ua fish_user_paths $HOME/.fig/bin


# Setting PATH for Python 3.9
# The original version is saved in /Users/iskanderiskakov/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin" "$PATH"

