#!/bin/bash

## Django
alias pm="python manage.py"
alias pmt="python manage.py test"
alias pmtf="python manage.py test --failfast"
alias show_urls="python manage.py show_urls"
alias makemigrations="python manage.py makemigrations"
alias migrate="python manage.py migrate"

## Git
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
