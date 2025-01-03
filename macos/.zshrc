# Le prime due sezioni servono ad attivare il prompt beautifier 

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# activates the pl10k 
#source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fixing words arrow movements in zsh
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
# bindkey "^[[D" beginning-of-line
# bindkey "^[[D" end-of-line

# Some ALIASES
alias ls='eza --git --icons=auto --color=auto --group-directories-first'
alias la='ls -alh'
alias clc=clear
alias ll='ls -lh'
alias lla="ll -a"
alias "cd.."="cd .."

# Completion for files and dirs at TAB
autoload -Uz compinit
compinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# zsh autosuggestion activation (the one downloaded from Brew)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh syntax highlighting activation (the one from Brew)
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zoxide (better cd)
eval "$(zoxide init zsh)"
# alias cd="z"

# Starship prompt terminal activation
eval "$(starship init zsh)"

# Created by `pipx` on 2024-08-03 17:38:00
export PATH="$PATH:/Users/mrokk/.local/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mrokk/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mrokk/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/mrokk/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mrokk/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/mrokk/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/mrokk/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
