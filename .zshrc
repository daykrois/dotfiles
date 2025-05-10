if [[ "$(tty)" == /dev/tty* ]]; then
  typeset -g POWERLEVEL9K_MODE=ascii
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi




### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

 # 加载语法高亮插件
 zinit ice lucid # 优化: 添加 lucid 以启用 Turbo 模式
 zinit light zdharma-continuum/fast-syntax-highlighting

 # 加载自动建议插件
 zinit ice lucid # 优化: 添加 lucid 以启用 Turbo 模式
 zinit light zsh-users/zsh-autosuggestions

 # 加载 powerlevel10k 主题
 zinit ice depth"1" lucid # 优化: 添加 lucid 并保留 depth"1"
 zinit light romkatv/powerlevel10k

# 加载所有插件后...  
autoload -Uz compinit  
compinit  
zinit cdreplay -q  # 重放所有捕获的compdef调用


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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


