function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '⠠⠵' && return
    echo '○'
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

PROMPT="╭─ %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+="%{$FG[120]%}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} %{$FG[205]%}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[039]%}%~%{$reset_color%}\$(git_prompt_info)\$(ruby_prompt_info) %{$FG[239]%}%*%{$reset_color%}
╰─\$(virtualenv_info)\$(prompt_char) "

function precmd() {
  if test $? -eq 0;
  then
    ret_code="%{$FG[118]%} ${?} %{$reset_color%}"
    RPROMPT=$ret_code
  else
    ret_code="%{$FG[203]%} ${?} %{$reset_color%}"
    RPROMPT=$ret_code
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔"
ZSH_THEME_RUBY_PROMPT_PREFIX=" %{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"
