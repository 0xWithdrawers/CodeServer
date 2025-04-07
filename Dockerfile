FROM --platform=linux/amd64 codercom/code-server:4.98.2

ARG HOME="/home/coder"

# Install the necessary dependencies
RUN sudo apt-get update && \
    sudo apt-get install -y \
    libssl-dev \
    pkg-config \
    libudev-dev \
    python3 \
    python3-pip \
    pipx \
    && sudo rm -rf /var/lib/apt/lists/*

# Install Rust, Solana CLI & Anchor
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN sh -c "$(curl -sSfL https://release.anza.xyz/stable/install)"

ENV PATH="$PATH:$HOME/.cargo/bin:$HOME/.cargo/env:$HOME/.local/share/solana/install/active_release/bin"
RUN cargo install --git https://github.com/coral-xyz/anchor --tag v0.31.0 anchor-cli

# Install NodeJS & Yarn
RUN curl https://deb.nodesource.com/setup_22.x | sudo bash
RUN sudo apt-get install -y nodejs && \
    sudo npm install --global yarn

# Install Slither
RUN pipx install slither-analyzer

# Install Foundry
RUN curl -L https://foundry.paradigm.xyz | bash && \
    bash -c "source $HOME/.bashrc" && /home/coder/.foundry/bin/foundryup

ENV PATH="$PATH:$HOME/.local/bin"

# Download the VSCode Audit Bookmarks extension
RUN cd /home/coder/ && \
    wget https://github.com/JoshuaMart/vscode-audit-bookmarks/releases/download/v0.1.0/vscode-audit-bookmarks-0.1.0.vsix
