#!/bin/bash
sudo curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
sh -c "$(curl -sSfL https://release.solana.com/v1.10.4/install)"
export PATH="/home/ubuntu/.local/share/solana/install/active_release/bin:$PATH"
sudo npm install -g mocha
cargo install --git https://github.com/project-serum/anchor anchor-cli --locked
solana --version
solana config set --url localhost
solana config get