# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Exports
export NODE_ENV=development;

# General comands
ll() { ls -alF $@; }
la() { ls -Ai $@; }
l() { ls -CF $@; }
hist() { history | grep $@; }
pe() { cd ~/environment-in-a-box; git pull origin master; }
dv() { cd ~/dev; }
prt() { lsof -n -i4TCP:$1 | grep LISTEN; }
ssha() { eval $(ssh-agent) && ssh-add; }
bp() { cat ~/environment-in-a-box/.bashrc; }
bl() { cat ~/.bash_local; }
ue() { source ~/environment-in-a-box/.bashrc; }

# Docker
dock() { docker-machine start; docker-machine env; eval "$(docker-machine env default)"; }
dssh() { docker exec -it $1 /bin/bash; }
dcssh() { if [ -z $1 ]; then docker-compose exec $(basename `pwd`) /bin/bash; else docker-compose exec $1 /bin/bash; fi }
dp() { docker ps | grep $1; }
dc() { docker-compose $@; }
dcrsb() { if [ -z $1 ]; then docker-compose build $(basename `pwd`); dcrs; else docker-compose build $1; dcrs $1; fi }
dcbrs() { if [ -z $1 ]; then docker-compose build $(basename `pwd`); dcrs; else docker-compose build $1; dcrs $1; fi }
dcrs() { if [ -z $1 ]; then docker-compose stop $(basename `pwd`); docker-compose rm -f $(basename `pwd`); docker-compose up -d $(basename `pwd`); else docker-compose stop $1; docker-compose rm -f $1; docker-compose up -d $1; fi }
dcl() { if [ -z $1 ]; then docker-compose logs -f $(basename `pwd`); else docker-compose logs -f $1; fi }


# Languages
## Ruby
rt() { bundle exec rake test $@; }
rs() { bundle exec rails server $@; }
rsp() { bundle exec rails server -p $@; }
rc() { bundle exec rails c; }
be() { bundle exec $@; }

## Python
ve() { type foo &>/dev/null || source /usr/local/bin/virtualenvwrapper.sh; }

# git
gc() { git add -A; git commit -m "$1"; }
gpq() { gpb qa; }
gpd() { gpb develop; }
gpm() { gpb master; }
gpb() { git checkout $1; git pull origin $1; }
gs() { git status; }
gb() { git checkout -b "$1"; }
gr() { echo "You sure?"; read answer; if [ "$answer" == "no" ]; then echo "Skipped"; else git reset --hard HEAD; fi }
prune() {  comm -13 <(git branch -r | cut -d'/' -f 2) <(git branch --merged | grep -v "*") |  awk '{print "git branch -D " $1}'; }
prunef() {  comm -13 <(git branch -r | cut -d'/' -f 2) <(git branch --merged | grep -v "*") | xargs git branch -D; }

if [ -f ~/.bash_local ]; then
      . ~/.bash_local   # --> Read /etc/bashrc, if present.
fi

