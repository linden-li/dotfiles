sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# #!/usr/bin/env sh

# # Check if Zsh is installed
# if ! command -v zsh &> /dev/null; then
#     echo "Zsh is not installed. Checking the operating system..."

#     # Check if the operating system is macOS
#     if [ ! -d "/Applications" ]; then
#         echo "This is not macOS. Attempting to install Zsh using apt..."
#         apt update && apt install -y zsh
#     else
#         echo "This is macOS. Please install Zsh manually."
#     fi
# fi

# # Change the default shell to Zsh
# if [ "$SHELL" != "$(which zsh)" ]; then
#     echo "Changing the default shell to Zsh..."
#     chsh -s "$(which zsh)"
# fi


# # From: https://github.com/JJGO/dotfiles/blob/master/shell-setup.sh
# set -x
# set -e

# #######################
# # BIN
# #######################

# function pull_repo() {
#     cd $1
#     git pull
#     cd -
# }

# mkdir -p $HOME/bin

# # FASD
# if [[ ! -f $HOME/bin/fasd ]]; then
#     git clone https://github.com/clvv/fasd.git /tmp/fasd
#     cd /tmp/fasd
#     PREFIX=$HOME make install
#     cd -
# fi

# # FZF
# if [[ ! -f $HOME/.fzf/bin/fzf ]]; then
#     git clone https://github.com/junegunn/fzf.git $HOME/.fzf
#     yes | $HOME/.fzf/install
# fi

# # DIFF-SO-FANCY
# if [[ ! -f $HOME/bin/diff-so-fancy ]]; then
#     curl -o $HOME/bin/diff-so-fancy https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
#     chmod +x $HOME/bin/diff-so-fancy
# fi


# #######################
# # TMUX
# #######################

# if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
#     mkdir -p $HOME/.tmux/plugins
#     git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
# fi
# pull_repo $HOME/.tmux/plugins/tpm

# mkdir -p $HOME/.zsh



# #######################
# # NEOVIM
# #######################

# NVIM=$HOME/.neovim
# mkdir -p $NVIM

# # AppImage in case the computer does not have a fallback nvim (appimage does not self update)
# if command -v nvim > /dev/null; then
#     echo "NVIM appears to be installed"
# else
#     mkdir -p $NVIM/bin
#     cd $NVIM/bin
#     curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
#     chmod u+x nvim.appimage
#     mv nvim.appimage nvim
#     cd -
# fi

# # Create Python3 environment
# if [[ ! -d $NVIM/py3 ]]; then
#     python3 -m venv $NVIM/py3
#     PIP=$NVIM/py3/bin/pip
#     $PIP install --upgrade pip
#     $PIP install neovim
#     $PIP install 'python-language-server[all]'
#     $PIP install pylint isort jedi flake8
#     $PIP install black yapf
# fi

# #######################
# # RUST
# #######################

# if [[ ! -d $HOME/.rustup ]]; then
#     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# fi

# for crate in bat fd-find ripgrep exa tealdeer procs ytop hyperfine bandwhich
# do
#     $HOME/.cargo/bin/cargo install $crate
# done

# mv ~/.zshrc ~/.zshrc_backup
# ln -sf $HOME/dotfiles/.zshrc ~/.zshrc

