### Download Docker Engine
First download and setup Docker Engine using the instructions at the link below for your OS:
- Windows: https://docs.docker.com/desktop/install/windows-install/   TODO: there is no "Engine". All I can see desktop
- Mac: https://docs.docker.com/desktop/install/mac-install/
- Linux: https://docs.docker.com/engine/install/
    - Note: DO NOT install Docker Desktop for Linux, rather, select your Linux distribution on the left sidebar and follow the distribution specific instructions for Docker engine. Docker Desktop runs with a different environment in Linux, and we may not be able to support it.
    - Remember to follow the post-installation steps for Linux: https://docs.docker.com/engine/install/linux-postinstall/
    - For Linux specific issues with Docker, feel free to email TA Luke Beukelman (lukebeukelman@mines.edu).


TODO: Explain how to open a terminal for windows /linux mac.

Open a new terminal on your computer and verify that your docker installation is working by running the following command:
```
$ docker run hello-world
```

If you docker installation is working you should get the following output:
```
Hello from Docker.
This message shows that your installation appears to be working correctly.
...
```

### Pulling the CSCI 442 docker
You will need to download the CSCI 442 docker image from the Docker Hub. To do this open your terminal and run:
```
$ docker pull csci442mines/student-env
```

You should now have the docker image on your computer. To verify you can run the following command to see all available images on your machine:
```
$ docker images
```

In the output of this command should be listed the CSCI 442 docker image:
```
REPOSITORY                 TAG       IMAGE ID       CREATED        SIZE
csci442mines/student-env   latest    84f85651e5f1   20 hours ago   1.71GB
```

### Initial Container Creation
Now that you have the Docker image pulled, you can now create the container that you will be developing in.

The [docker run](https://docs.docker.com/engine/reference/commandline/run/) family of commands helps in the creation of creating docker containers. Most of the initial settings for the docker container are set in this step, and can not be changed afterwards.

TODO: below, create two or three version (Windows/linux/mac). Replace the "source" value below with a folder named OS_projects. To be consistent we could also use OS_projects in the mapped folder insde container.

The command you will run in is as follows:
```
$ docker run -d --name operating_systems  --mount type=bind,source=<path to where you want to store csci442 files on your local computer>,target=/root/projects csci442mines/student-env
```

TODO: The command you will run in Windows is as follows:
```
$ cd $home
$ docker run -d --name operating_systems  --mount type=bind,source="$(pwd)\OS_projects",target=/root/projects csci442mines/student-env
```
TODO: This command will create a folder under "C:\Users\<your name>\OS_projects" 

TODO: You will use "docker run" command only once in the entire semester, unless you delete the container.

To break down the command:
* `docker run` is the command and sub-command to run a new docker image.
*  `-d` runs the container in detached mode, as opposed to running it in the foreground, making it so your terminal will not wait for the docker container to shut down. TODO: What happens when their battery runs out?
* `--mount type=bind,source=<path to where you want to store csci442 files on your local computer>,target=/root/projects` creates a bind mount, which makes it so that the changes in your Docker container are preserved on your computer, outside of the container. This makes it harder to lose your work!
    * TODO: on your local computer the project files will be sync'ed into a folder named "OS_projects" under your home directory.
    * TODO: Inside the container your project files will be under /root/projects
* `csci442mines/student-env` is the name of the image that you are creating a container from.

**We do not recommend deleting your Docker container.  This will delete everything inside of it, except for what is saved in the bind mount. However, if you accidentally do, follow this part of the guide again.**
### Sequential Container Runs
Every time you shut down your computer, or simply shut down the Docker container, you will need to start it back up again to use it. In some applications, it is useful to just re-create the Docker container every time you need it, but that would lead to file changes (except for bind mounts) not being saved (not ideal for coding!).

Instead, we will just restart the Docker container we initially created when we need it. To do this, simply run the command:

```
$ docker start operating_systems
```

TODO: The command above does not launch a command prompt on the container. I think we should repeat the instructions given under "Enter the docker container from the terminal" section in the docker-foo, here as well. 

Alternatively, in the Docker tab in vscode, you can also just right click the container, and click "Start". 

![[Pasted image 20230823175950.png]]
