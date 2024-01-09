You've chosen wisely (in my humble opinion, at least)! This guide will walk you through the simple process of setting up a development container using VSCode and Docker.
## Install Docker
First, you must have Docker installed. If you have not already done so, please follow the instructions at [[Installing Docker]].
## Download the [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) Extension Pack
It is highly likely that you have already downloaded this extension pack at some point. This extension pack includes Microsoft's set of extensions for enabling using VSCode with remote hosts. Included are the following extensions:
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) - What we will be using. This allows you to connect to and create Docker containers and run VSCode as if it were inside the container. It also allows you to use configuration files inside a directory to automatically initialize a dev container with additional [features](https://code.visualstudio.com/blogs/2022/09/15/dev-container-features) and [post-build scripts](https://code.visualstudio.com/docs/devcontainers/create-dev-container#_rebuild).
- [Remote - SSH](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh) - Allows you to run VSCode on an SSH connection. For example, you could use this to modify code files in a remote server, using VSCode on your laptop. This doesn't have the ability to set up a "all batteries included" container for your project like Dev Containers, but is useful on its own. *Note: DO NOT run this on Isengard. This has caused issues in the past.*
- [WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) - Similar to the SSH extension, except for Windows Subsystem for Linux.
- [Remote - Tunnels](https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-server) - Worth exploration on it's own, similar to SSH, except it doesn't need an open port accessible from the web. You simply need to enable tunnels in VSCode on a device you want to tunnel into, sign into GitHub on both the accessed and the accessing machine's VSCode, and you are able to access the device from anywhere without port forwarding or SSH.

## Create the Dev Container Configuration File
Inside your OS project directory (we recommend you to use OS_Projects, but you can name it whatever), we need to create the necessary directory structure. Download the [container_conf.zip](https://github.com/CSCI-442-Mines/student-env/blob/main/container_conf.zip) file, and unzip it into your project directory, so that the `.devcontainer` folder, which contains the `devcontainer.json` and `Dockerfile` files, is inside the root of your projects directory. Note that all files that start with a "." are hidden by default on most operating systems and file managers. VSCode generally does not hide dotfiles, though.

This is an example of what the directory looks like for our VSCode editing this documentation repository:

![[Screenshot from 2023-10-24 16-16-25.png]]

Our project root directory is student-end (capitalized as STUDENT-ENV), and at the top, in the root directory of the project (right under student-env/) is the `.devcontainer` directory.
## Pedal to the Metal, Let's Start Operating Some Systems!
Whenever you open up your project directory, a VSCode dialogue should show up asking you if you would like to open the directory in a container. Click `Reopen in Container`. For the first time, it may take a minute to build the container, but subsequent opens should be much faster.

![[Screenshot from 2023-10-24 16-12-55.png]]
