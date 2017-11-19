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
dcssh() { docker-compose exec $1 /bin/bash; }
dp() { docker ps | grep $1; }
alias dc="docker-compose"
dcrsb() { docker-compose build $1; dcrs $1; }
dcrs() { docker-compose stop $1; docker-compose rm -f $1; docker-compose up -d $1; }
dcl() { docker-compose logs -f $1; }

# Languages
## Ruby
alias rt="bundle exec rake test"
alias rs="bundle exec rails server"
alias rsp="bundle exec rails server -p"

# git
alias gc="git add -A; git commit -m"
gpq() { gpb qa; }
gpd() { gpb develop; }
gpm() { gpb master; }
gpb() { git checkout $1; git pull origin $1; }
alias gs="git status;"
alias gb="git checkout -b"
prune() {  comm -13 <(git branch -r | cut -d'/' -f 2) <(git branch --merged | grep -v "*") |  awk '{print "git branch -D " $1}'; }
prunef() {  comm -13 <(git branch -r | cut -d'/' -f 2) <(git branch --merged | grep -v "*") | xargs git branch -D; }

