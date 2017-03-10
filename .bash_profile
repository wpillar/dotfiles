alias st='git status'
alias denv='eval "$(docker-machine env default)"'
alias gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias dkill='docker kill "$(docker ps -q)"'

source '/Users/will/.git-completion.sh'

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTAT=1

export PS1='[\u@graze \[\e[0;34m\]$(pwd | cut -c13-)\[\e[0;35m\]$(__git_ps1 " (%s)")\[\e[0m]\]\$ '

function docker-cleanup () {
  EXITED=$(docker ps -q -f status=exited)
  DANGLING=$(docker images -q -f "dangling=true")

  if [ "$1" == "--dry-run" ]; then
    echo "==> Would stop containers:"
    echo $EXITED
    echo "==> And images:"
    echo $DANGLING
  else
    if [ -n "$EXITED" ]; then
      docker rm -f $EXITED
    else
      echo "No containers to remove."
    fi
    if [ -n "$DANGLING" ]; then
      docker rmi -f $DANGLING
    else
      echo "No images to remove."
    fi
  fi
}
