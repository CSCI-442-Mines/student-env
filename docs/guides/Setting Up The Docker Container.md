### Create your directory to store your projects in
We recommend creating a directory on your computer called `OS_Projects`, in which your projects will be synced with your Docker container. We recommend you place the folder in the following paths, depending on your operating system, for consistency.
* Windows: will be set up automatically in a later step.
* MacOS and Linux: under your home directory: `/home/<username>/OS_Projects`.

### Download Docker
For Windows and Mac, you will download Docker Desktop. For Linux, you will download Docker Engine. This is for historical reasons regarding the workarounds that were needed to port Docker to Mac and Windows.

First download and setup Docker Engine using the instructions at the link below for your OS:
- Windows: https://docs.docker.com/desktop/install/windows-install/
- Mac: https://docs.docker.com/desktop/install/mac-install/
- Linux: https://docs.docker.com/engine/install/
    - Note: DO NOT install Docker Desktop for Linux, rather, select your Linux distribution on the left sidebar and follow the distribution specific instructions for Docker engine. Docker Desktop runs with a different environment in Linux, and we may not be able to support it.
    - Remember to follow the post-installation steps for Linux: https://docs.docker.com/engine/install/linux-postinstall/
    - For Linux specific issues with Docker, feel free to email TA Luke Beukelman (lukebeukelman@mines.edu).

Open a new terminal on your computer. You should have used your computer's terminal in prior courses, but to ensure consistency:
* Windows: use cmd, aka Command Prompt
* MacOS: use terminal
* Linux: depends on specific distribution, you should know what your terminal is if you are using Linux :).
* 
Verify that your docker installation is working by running the following command:
```
$ docker run hello-world
```

If your docker installation is working you should get the following output:
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

The template of the command you will run in is as follows (do not run this command as it, "local sync path" needs to be filled in. Exact commands for Windows/MacOS/Linux are below):
```
$ docker run -d --name operating_systems  --mount type=bind,source=<local sync path>,target=/root/projects csci442mines/student-env
```

If you followed our guidance on the location for your local sync path, it should look like this for Windows (this is where the folder is automatically created):
```
$ cd %HomePath%
$ docker run -d --name operating_systems  --mount type=bind,source="%cd%\OS_projects",target=/root/projects csci442mines/student-env
```

Or like this for Linux and MacOS:
```
$ mkdir $HOME/OS_projects
$ docker run -d --name operating_systems  --mount type=bind,source=$HOME/OS_Projects,target=/root/projects csci442mines/student-env
```

To break down the command:
* `docker run` is the command and sub-command to run a new docker image.
*  `-d` runs the container in detached mode, as opposed to running it in the foreground, making it so your terminal will not wait for the docker container to shut down.
* `--mount type=bind,source=<path to where you want to store csci442 files on your local computer>,target=/root/projects` creates a bind mount, which makes it so that the changes in your Docker container are preserved on your computer, outside of the container. This makes it harder to lose your work!
	* Inside the container, your project files will be under `/root/projects`.
	* On your local computer the project files will be sync'ed into a folder named `OS_Projects`, wherever you created it in accordance with our guidance in [[Setting Up The Docker Container#Create your directory to store your projects in]].

* `csci442mines/student-env` is the name of the image that you are creating a container from.
* 
**Note: You will use "docker run" command only once in the entire semester, unless you delete the container.**

**Note: We do not recommend deleting your Docker container (see: [[Avoiding Data Loss and Other Important Notes#Do not delete your Docker container!!!!!]]).  This will delete everything inside of it, except for what is saved in the bind mount. However, if you accidentally do, follow this part of the guide again.**

### Sequential Container Runs
Every time you shut down your computer, or simply shut down the Docker container, you will need to start it back up again to use it. In some applications, it is useful to just re-create the Docker container every time you need it, but that would lead to file changes (except for bind mounts) not being saved (not ideal for coding!).

Instead, we will just restart the Docker container we initially created when we need it. To do this, simply run the command:

```
$ docker start operating_systems
```

This command only runs the Docker container in the background. To access the container, you will either want to open it in VSCode ([[Using Visual Studio Code]]), or in a terminal ([[Opening a Docker Container's Terminal]]).

Alternatively, in the Docker tab in vscode, you can also just right click the container, and click "Start". 

![[Pasted image 20230823175950.png]]
