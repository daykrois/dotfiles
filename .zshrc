# =============================
# = 公共部分：所有环境下都执行 =
# =============================

# 安装并加载 Zinit（如果尚未安装）
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit  "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# 历史记录设置
HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# 加载语法高亮和自动建议（所有环境都保留）
zinit ice lucid
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice lucid
zinit light zsh-users/zsh-autosuggestions


# =============================
# = 判断是否是 TTY 终端？     =
# =============================

if [[ "$(tty)" == /dev/tty* ]]; then

  # === TTY 模式下使用的最简提示符 ===
  PROMPT='%n@%m %~ %# '
  RPROMPT=''

else

  # === 非 TTY 模式（图形终端/SSH/tmux）加载完整主题支持 ===

  # Enable Powerlevel10k instant prompt
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # Load annexes
  zinit light-mode for \
      zdharma-continuum/zinit-annex-as-monitor \
      zdharma-continuum/zinit-annex-bin-gem-node \
      zdharma-continuum/zinit-annex-patch-dl \
      zdharma-continuum/zinit-annex-rust

  # Load Powerlevel10k theme
  zinit ice depth"1" lucid
  zinit light romkatv/powerlevel10k

  # Load custom p10k configuration
  [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

  # Load compinit and replay compdefs
  autoload -Uz compinit
  compinit
  zinit cdreplay -q

fi
