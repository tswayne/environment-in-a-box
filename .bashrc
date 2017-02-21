# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


if [ -f ~/.bash_local ]; then
      . ~/.bash_local   # --> Read /etc/bashrc, if present.
fi

# Exports
export NODE_ENV=development;

# Comands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias hist="history | grep "
alias update-env="cd ~/environment-in-a-box; git pull origin master";
alias dock='docker-machine start; docker-machine env; eval "$(docker-machine env default)"'
alias dv="cd ~/dev";
prt() { lsof -n -i4TCP:$1 | grep LISTEN; }
# Languages
## Ruby
alias rt="bundle exec rake test"
alias rs="bundle exec rails server"
alias rsp="bundle exec rails server -p"

# git
alias gc="git add -A; git commit -m"
alias gpm="git checkout master; git pull origin master;"
alias gs="git status;"
alias gb="git checkout -b"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

