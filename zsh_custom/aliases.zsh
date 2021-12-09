# Shortcuts
alias c="clear"
# alias rm="trash"
alias cdir="copydir"
alias snano="sudo nano"
alias hs="history | grep"
alias myip="curl https://ipecho.net/plain; echo"


# Directories
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias home="cd $HOME"
alias ~="cd $HOME"
alias -- -="cd -"
alias dev="cd $HOME/dev"
alias sites="cd $HOME/dev/Sites"
alias projects="cd $HOME/dev/Projects"


# PHP
alias composer="php -d memory_limit=-1 /usr/local/bin/composer"
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias c="php -d memory_limit=-1 /usr/local/bin/composer"
alias cu="php -d memory_limit=-1 /usr/local/bin/composer update"
alias cr="php -d memory_limit=-1 /usr/local/bin/composer require"
alias ci="php -d memory_limit=-1 /usr/local/bin/composer install"
alias cda="php -d memory_limit=-1 /usr/local/bin/composer dump-autoload -o"
alias salts="wp dotenv salts generate"


# JS
alias nfresh="rm -rf node_modules/ package-lock.json yarn.lock && yarn"
alias watch="yarn watch"

# Git
alias gftp="git ftp"
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"
