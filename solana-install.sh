#!/bin/bash

# Install Rust
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# Install Solana
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Install npm packages globally
npm install -g mocha ts-node

# Install Anchor CLI
cargo install --git https://github.com/project-serum/anchor anchor-cli --locked

# Verify Solana installation
solana --version

# Configure Solana
solana config set --url localhost
solana config get

# Clean up
rm -rf $HOME/.cargo/registry  # Remove cargo registry cache
apt-get clean  # Clean up apt cache