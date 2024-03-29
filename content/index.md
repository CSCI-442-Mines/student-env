---
title: CSCI 442 student environment
---
## What is Docker?
Docker is a tool that allows developers to easily deploy their applications in a sandbox (called containers) to run on the host operating system. The key benefit of Docker is that it allows users to package an application with all of its dependencies into a reproducible and modular "container" for software development.

## What are containers?
Containers are used to run software as an alternative to virtual machine. Containers offer a logical packaging mechanism in which applications can be abstracted from the environment in which they actually run. This decoupling allows container-based applications to be deployed easily and consistently. Containers provide most of the isolation of virtual machines at a fraction of the computing power.

### What are images?
The blueprints of our application which form the basis of containers.

## How is CSCI 442 using Docker and containers?
We are using docker to allow you to setup an isolated Linux environment with all the necessary packages for CSCI 442 projects. This will allow you to run your CSCI 442 code in a Linux environment regardless of your computer's OS. We will give you a docker image which sets up an environment identical to the autograder which ensures that your code will run inside this docker with the same result output as on the autograder. See below for steps to set up the CSCI 442 docker.

## What are dev containers?
Dev containers are a feature provided by Visual Studio Code that make creating containers to develop your code in very convenient. Dev containers offer the following advantages over configuring your own Docker container:
#### Dev Container Advantage 1: Easy integration with VSCode
While it is still easy to connect to a container with VSCode (a feature of the dev containers extension), using dev containers as we are in this course makes it even easier. All you have to do is open VSCode into a directory with a dev container config, and vscode will automatically ask you if you would like to open the associated container.
#### Dev Container Advantage 2: Automatic bind mounts
Bind mounts make it so that your Docker container has access to a folder on your host machine. To the Docker container, a bind mount looks like a normal folder, except for that the contents of the folder are automatically and immediately synced between your host and the Docker container.

This allows for a much more seamless development experience, as you can drag files in and out of your project folder without having to synchronize the files manually between the two hosts. 

You can create bind mounts manually, but dev containers create them by default with the directory the container configuration is in.

## Guides
- Recommended - [[Using Development Containers]]
* Not recommended - [[Using Vanilla Docker or WSL]]



