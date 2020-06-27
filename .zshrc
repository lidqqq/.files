PATH="./node_modules/.bin:$PATH"

# alias
## git
alias add='git add'
alias b='git branch'
alias clean='git clean'
alias clone='git clone'
alias co='git checkout'
alias commit='git commit'
alias diff='git diff --ignore-space-change'
alias fetch='git fetch --all'
alias log='git log'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias rebase='git rebase'
alias reset='git reset'
alias s='git status -s'
alias stash='git stash'
alias acw="git add . && git commit -m \":dog:\""

# npm
alias nr="npm run"
alias nt="npm test"
alias nd="npm run dev"
alias nb="npm run build"
alias ns="npm run start"

## docker
alias d='docker'
alias dc='docker-compose'
alias drca='docker rm `docker ps -a -q`'
alias dria='docker rmi -f `docker images -aq`'
alias drva='docker volume rm $(docker volume ls -qf dangling=true)'
alias dsp='docker system prune'

## other
alias c='clear'
alias l='ls'
alias ll='ls -Glah'
alias nodem='node --experimental-modules'
alias nodep='node --optimize_for_size --max_old_space_size=920 --gc_interval=100'
alias tosjis='nkf -s --overwrite'
alias toutf8='nkf -w --overwrite'
alias vi='vim'
alias xcurl='httpstat'
alias xman='tldr'
alias xtop='gtop'

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

init_repo() {
  # delete any of the below per your preference
  mkdir $1 && cd $_
  git init
  npm init -y
  npx license $(npm get init.license) -o "$(npm get init.author.name)" > LICENSE
  npx gitignore node
  npx covgen "$(npm get init.author.email)"
  git add -A
  git commit -m "Initial commit"
}

# https://github.com/shannonmoeller/up
source ~/.config/up/up.sh
