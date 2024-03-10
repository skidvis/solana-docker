FROM node:16

# Install necessary packages
RUN apt update && \
    apt install -y \
    openssh-server \
    sudo \
    curl \
    nano \
    git \
    libssl-dev \
    libudev-dev \
    pkg-config \
    zlib1g-dev \
    llvm \
    clang \
    make \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user for SSH
RUN useradd -rm -d /home/ubuntu -s /bin/bash -u 1010 sshuser && \
    echo 'sshuser:password' | chpasswd && \
    usermod -aG sudo sshuser

# Start SSH service
RUN service ssh start

# Copy Solana install script
COPY solana-install.sh /home/ubuntu

# Expose SSH port
EXPOSE 22

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
