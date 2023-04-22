zstyle ':completion:*:*:git:*' script /Users/will/git/dotfiles/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '(%b)'

# Set up the prompt (with git branch name)
autoload -U colors && colors
setopt PROMPT_SUBST
PROMPT='%n %{$fg[magenta]%}[${PWD/#$HOME/~}]%{$reset_color%} %{$fg[cyan]%}${vcs_info_msg_0_}%{$reset_color%} %# '