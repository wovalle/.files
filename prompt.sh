prompt_function() {
  local         BLUE='\[\033[01;34m\]'
  local          RED='\[\033[0;31m\]'
  local    LIGHT_RED='\[\033[1;31m\]'
  local        GREEN='\[\033[0;32m\]'
  local BRIGHT_GREEN='\[\033[01;32m\]'
  local  LIGHT_GREEN='\[\033[1;32m\]'
  local       YELLOW='\[\033[0;33m\]'
  local        WHITE='\[\033[1;37m\]'
  local   LIGHT_GRAY='\[\033[0;37m\]'
  local         GRAY='\[\033[1;30m\]'
  local        RESET='\[\033[0m\]'

  if test $(git status 2> /dev/null | grep -c :) -eq 0; then
    git_color="${GREEN}"
  else
    git_color="${RED}"
  fi

  PS1="${BLUE}\u${RESET}:${GRAY}$AWS_ENVIRONMENT${git_color}$(__git_ps1)${YELLOW}\w${RESET}\$ "

  if [ -z "$TERMINAL_COMMENT" ]; then
    comment=""
  else
    comment=" ($TERMINAL_COMMENT)"
  fi

  echo -ne "\033]0;${PWD##*/}$comment\007"
}
PROMPT_COMMAND=prompt_function
