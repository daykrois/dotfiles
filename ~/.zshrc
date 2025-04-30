# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ---- Zinit 初始化部分（保持不变）----
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

# ---- Annexes 加载 ----
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ---- 优化后的插件配置 ----
# 核心插件（立即加载）
zinit wait"0" lucid for \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions

# 语法高亮（延迟加载+防冲突）
zinit wait"1" lucid atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" for \
    zsh-users/zsh-syntax-highlighting

# 实用工具（按需加载）
zinit wait"2" lucid for \
    wfxr/forgit \
    hlissner/zsh-autopair



# 加载 Powerlevel10k 主题（仅在图形终端中加载）
if [[ $TERM != "linux" && $TERM != "dumb" ]]; then
    zinit ice depth=1; zinit light romkatv/powerlevel10k
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
    # TTY 环境下使用简单主题
    export PS1="%n@%m %~ %# "
fi


