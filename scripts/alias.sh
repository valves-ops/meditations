#!/bin/bash

## Django
alias pm="python manage.py"
alias pmt="python manage.py test"
alias pmtf="python manage.py test --failfast"
alias show_urls="python manage.py show_urls"
alias makemigrations="python manage.py makemigrations"
alias migrate="python manage.py migrate"

## Git
git_current_branch () {
        local ref
        ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null) 
        local ret=$? 
        if [[ $ret != 0 ]]
        then
                [[ $ret == 128 ]] && return
                ref=$(command git rev-parse --short HEAD 2> /dev/null)  || return
        fi
        echo ${ref#refs/heads/}
}

alias grum="git checkout master && git pull origin master && git checkout - && git rebase master"
alias gpoh="git push origin HEAD"
alias gpfoh="git push -f origin HEAD"
alias gpom="git pull origin master"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gpsup="git push --set-upstream origin $(git_current_branch)"
