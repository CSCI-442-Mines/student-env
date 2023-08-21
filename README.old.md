# Setup Guide

## Step 1: Install Docker
Follow the instructions at https://docs.docker.com/engine/install/

***For Linux users: DO NOT install Docker desktop. On the installation page, on the left navigation bar, under "Install", select the Linux distribution you are using and follow those instructions.***

***Also for Linux users: After installing Docker, you will need to add your user to the Docker group. To do this, run `sudo groupadd docker` and then `sudo usermod -aG docker $USER`. You will need to restart for the changes to apply.***


## Step 2: Install the "Docker" and "Remote Development" extensions in VSCode

The extension names are exactly as is on the extension search page. You can also search by the extension ids to get an extact match:
1. Remote Development: ms-vscode-remote.vscode-remote-extensionpack
2. Docker: ms-azuretools.vscode-docker

## Step 3: Pull the CSCI442 docker image and initialize the container

### Command line:
"docker pull csci442mines" and then "docker run -d --name csci442 lbeuk/csci442mines:latest"

## Step 4: Run the docker image and open in VSCode

### Command line:
"docker start csci442" will start the docker container in the background. You do not need to do this immediately after running the "docker run" command, as the container is already running. You DO need to run this every time your computer or the docker container shut down.

### Opening in VSCode
To open the Docker container in VSCode, after starting the container, open up the Docker tab in the left side bar (looks like a whale with boxes on top of it), find the box labeled "lbeuk/csci442mines:latest" (note: it should have a green play button next to it if it is running), right click it, and select "Attach Visual Studio Code". This should open a VSCode window in the Docker container.

## Step 5: Setting up GitHub
***Note: If you already have SSH keys set up on github for this device, you may be able to skip this step. VSCode server seems to copy keys over. Attempt step 7, and if it doesn't work, return here.***

Before you can access the course project code, you will first need to set up an ssh key in the docker container.

To generate a ssh key, run the following command: `ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""`.

This will generate a new ssh public/private key pair. Now, we need to copy the public key and paste it into github.

To copy the public key, run `cat /root/.ssh/id_rsa.pub`, and copy the key, starting with "ssh-rsa".

Here is an example of an RSA key generated in the docker image:
> ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVxQb9VNXSh+4jpAYzwN9165jzPMbGIAxFaNaqjc+pzeVY7HfBYA6Jl1XCYAQoXJIQ8X1kz6cquEYIVHyICV85RTxhB3rrAl50tjyQ6QqjEKzNMPEPZFiii+QtOuA9zDBD3G/DHr5dJBThSbD91wbSlm8a2ZCXMb/aQnAOzpm/MM1Si+9T+bvMjOlUqKzZTtQgKbGGgyHWIdNdbe13G+aKNQWThuzu9uJu3sRwXePSy2TTUKi4elDqM6C/Hin+ePBQKeyu11GvpBy6cWGT3thtdHJ18a6L67oDMVE82uxQCqdd9xrL7d6pODB3PSebNpvmbejdZaWrA42j+4pLw1PCmXQ+VyiwVYlhKRRusHD327G4l/4R9BVZY3OPYSnhL1tyGHlxgfY2WbkX0d5cvA7QCLz9m7YIWAq5J/HG8XL2iT7LFNMKuzCz9njpHHPiDc+1tGSQ8/BxP9xbGrjNVuVKsv/lTgv3MRV0qv3MIhgzFj0hicgd0uqmhF1f7wyslwc= root@5bec5adb9a8a

On a browser, open https://github.com/settings/ssh/new, log in if not already logged in, and paste into the "Key" box the copied key. For a title, name it whatever you want, "OS Docker" as a suggestion.

## Step 6: Pullings your projects

Once you are in the Docker container, you should be able to clone your git projects in here ads you would any other Linux machine.

We recomend you clone your projects in the "/root/projects" directory.