apt update
apt install -y bat fzf fd-find
apt-get install ripgrep

# bottom
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb
sudo dpkg -i bottom_0.9.6_amd64.deb

# cargo
curl https://sh.rustup.rs -sSf | sh
cargo install procs 
