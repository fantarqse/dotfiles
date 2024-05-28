# Source private variables
source ~/.zshrc_private

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory for the plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it is not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone git@github.com:zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source Zinit
source "${ZINIT_HOME}/zinit.zsh" 

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit load zsh-users/zsh-syntax-highlighting.git
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'

# Load completion
autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
# bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion tuning
zstyle ':completion*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion*' list-colors '${(s.:.)LS_COLORS}'

# Aliases
alias ls='ls --color'
alias ll='ls -l --color'
alias la='ls -la --color'
alias careeros-dev='gcloud config configurations activate default && cloud-sql-proxy --port 5555 --credentials-file $CARREROS_DEV_CRED_FILE $CARREROS_DEV_INSTANCE'
alias careeros-prod='gcloud config configurations activate tcos-prod && cloud-sql-proxy --port 5556 --credentials-file $CARREROS_PROD_CRED_FILE $CARREROS_PROD_INSTANCE'
