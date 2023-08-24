FROM ubuntu:22.04
LABEL maintainer="lbeuk@pm.me"

# Dependencies for git
RUN apt-get update && apt-get install -y \
    openssh-client \
    git \
    build-essential \
    clang \
    gdb \
    valgrind \
    vim \
    neovim \
    nano \
    emacs \
    libreadline-dev \
    libboost-dev

# Create the projects directory
RUN mkdir /root/projects

# Make it so dev container does not exit
CMD tail -f /dev/null