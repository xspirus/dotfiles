#!/bin/zsh

alias gbd="git branch --show-current | sed -E 's:(.*)/(dev|staging|prod):\1/dev:'"
alias gbs="git branch --show-current | sed -E 's:(.*)/(dev|staging|prod):\1/staging:'"
alias gbp="git branch --show-current | sed -E 's:(.*)/(dev|staging|prod):\1/prod:'"
