FROM ubuntu:22.04
LABEL maintainer="lbeuk@pm.me"

RUN apt-get update

# Dependencies for git
RUN apt-get -y install openssh-client git

# Compilation dependencies
RUN apt-get -y install build-essential clang

# Debug tools
RUN apt-get -y install gdb valgrind

# Popular editors
RUN apt-get -y install vim neovim nano emacs

# Dependencies needed for project 2
RUN apt-get -y install libreadline-dev

# Dependencies needed for project 5
RUN apt-get -y install libboost-dev

# Create the projects directory
RUN mkdir /root/projects

# Make it so dev container does not exit
CMD tail -f /dev/null