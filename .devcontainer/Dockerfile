FROM mcr.microsoft.com/devcontainers/base:jammy
LABEL maintainer="lbeuk@pm.me"

# Dependencies for git
RUN apt-get update && apt-get install -y \
    openssh-client \
    git \
    zip \
    # Needed for building code
    build-essential \
    clang \
    libreadline-dev \
    libboost-dev \
    # Needed for debugging
    gdb \
    valgrind \
    # Editor options
    vim \
    neovim \
    nano \
    emacs
