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
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# Comands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias hist="history | grep "
alias update-env="cd ~/environment-in-a-box; git pull origin master";
alias dv="cd ~/dev";
prt() { lsof -n -i4TCP:$1 | grep LISTEN; }
alias menv='cat ~/environment-in-a-box/.bashrc'

# Docker
alias dock='docker-machine start; docker-machine env; eval "$(docker-machine env default)"'
dssh() { docker exec -it $1 /bin/bash; }
dp() { docker ps | grep $1; }
alias dc="docker-compose"
dcrs() { docker-compose stop $1; docker-compose rm -f $1; docker-compose up -d $1; }
dcl() { docker-compose logs -f $1; }

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
prune() {  comm -13 <(git branch -r | cut -d'/' -f 2) <(git branch --merged | grep -v "*") |  awk '{print "git branch -D " $1}'; }
prunef() {  comm -13 <(git branch -r | cut -d'/' -f 2) <(git branch --merged | grep -v "*") | xargs git branch -D; }


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
