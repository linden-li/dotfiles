mkdir -p $HOME/.zsh

# git aliases
source $HOME/dotfiles/git_alias.zsh

# autocomplete
if [[ ! -d $HOME/.zsh/fast-syntax-highlighting ]]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.zsh/fast-syntax-highlighting
fi

if [[ ! -d $HOME/.zsh/zsh-history-substring-search ]]; then
    git clone https://github.com/zsh-users/zsh-history-substring-search $HOME/.zsh/zsh-history-substring-search
fi

if [[ ! -d $HOME/.zsh/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
fi

if [ -f $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
  source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

if [ -f $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source $HOME/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

if [ -f $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if ! command -v starship >/dev/null 2>&1; then
    echo "Starship is not installed. Installing now."
    curl -sS https://starship.rs/install.sh | sh
else
    echo "Starship is already installed."
fi

eval "$(starship init zsh)"
