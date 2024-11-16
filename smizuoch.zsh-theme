# Gitブランチ名の色を設定する関数
function git_branch_name_color() {
  local branch=$(git_current_branch)
  if [[ "$branch" == "master" || "$branch" == "main" ]]; then
    echo "%{$fg[red]%}$branch%{$reset_color%}"
  else
    echo "%{$fg[white]%}$branch%{$reset_color%}"
  fi
}

# Git状態を取得して色を設定する関数
function git_status_color() {
  local git_status=$(git status --porcelain 2> /dev/null)
  if [[ -n "$git_status" ]]; then
    # ワーキングツリーに変更がある場合は黄色
    echo "%{$fg[yellow]%}✗%{$reset_color%}"
  else
    # ワーキングツリーがクリーンな場合は緑
    echo "%{$fg[green]%}✔%{$reset_color%}"
  fi
}

# 現在のディレクトリとGitブランチを表示する関数
function get_pwd_and_git_branch() {
  echo "%{$fg[cyan]%}%~%{$reset_color%}$(git_prompt_info)"
}

# プロンプトの色を設定する関数
function set_prompt_color() {
  echo "%(?.%{$fg[green]%}.%{$fg[red]%})>"
}

# Gitプロンプト情報の設定
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%}"

# プロンプトの設定
PROMPT='$(get_pwd_and_git_branch)
$(set_prompt_color)%{$reset_color%} '

# Gitブランチ情報をカスタマイズ
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git_branch_name_color)$(git_status_color)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
