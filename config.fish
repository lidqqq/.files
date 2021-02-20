set -x fish_greeting
set GOOGLE_IT_EXCLUDE_SITES qiita.com
set -x PATH /opt/local/bin/ /usr/local/sbin $PATH

function init_repo
  # delete any of the below per your preference
  mkdir $argv[1]
  cd $argv[1]
  git init
  npm init -y
  npx gitignore node
  git add -A
  git commit -m "Initial commit"
  code-insiders -r .
end

function g
  abbr --show | grep "git $argv[1]"
end

function gi
  google-it --query="$argv[1]" --limit 5
end
