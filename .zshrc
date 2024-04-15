mkdir -p $HOME/.zsh

export ZSH="$HOME/.oh-my-zsh/"
ZSH_THEME="robbyrussell"

# git aliases
source $HOME/dotfiles/git_alias.zsh

# Setup oh-my-zsh 
if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting ]]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search ]]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
fi

if [[ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

plugins=(
  zsh-history-substring-search 
  zsh-autosuggestions 
  fast-syntax-highlighting 
)

source $ZSH/oh-my-zsh.sh


if ! command -v starship >/dev/null 2>&1; then
    echo "Starship is not installed. Installing now."
    curl -sS https://starship.rs/install.sh | sh
fi

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
