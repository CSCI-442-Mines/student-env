# CSCI442 Student Environment
Student environment for CSCI442 programming projects
## Basic Docker Setup
### What is Docker

Docker is a tool that allows developers to easily deploy their applications in a sandbox (called containers) to run on the host operating system. The key benefit of Docker is that it allows users to package an application with all of its dependencies into a standardized unit for software development. Unlike virtual machines, containers do not have high overhead and hence enable more efficient usage of the underlying system and resources.

#### What are containers
Container are used to run software as an alternative to virtual machine. Containers offer a logical packaging mechanism in which applications can be abstracted from the environment in which they actually run. This decoupling allows container-based applications to be deployed easily and consistently. Containers provide most of the isolation of virtual machines at a fraction of the computing power.

#### What are images
The blueprints of our application which form the basis of containers.

#### How is CSCI 442 using Docker
We are using docker to allow you to setup an isolated Linux environment with all the necessary packages for CSCI 442 projects. This will allow you to run your CSCI 442 code in a Linux environment regardless of your computer's OS. We will give you a docker image which sets up an environment identical to the autograder which ensures that your code will run inside this docker with the same result output as on the autograder. See below for steps to set up the CSCI 442 docker.

### Download Docker Engine
First download and setup Docker Engine using the instructions at the link below for your OS:
- Windows: https://docs.docker.com/desktop/install/windows-install/
- Mac: https://docs.docker.com/desktop/install/mac-install/
- Linux: https://docs.docker.com/engine/install/
    - Note: DO NOT install Docker Desktop for Linux, rather, select your Linux distribution on the left sidebar and follow the distribution specific instructions for Docker engine. Docker Desktop runs with a different environment in Linux, and we may not be able to support it.
    - Remember to follow the post-installation steps for Linux: https://docs.docker.com/engine/install/linux-postinstall/
    - For Linux specific issues with Docker, feel free to email TA Luke Beukelman (lukebeukelman@mines.edu).

Open a new terminal on your computer and verify that your docker installation is working by running the following command:
```
$ docker run hello-world
```
If you docker installtion is working you should get the following output:
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
### Basic docker commands
Once you have the CSCI 442 docker downloaded you are ready to start using this docker.

#### Running a docker image
You can run any available image using: `docker run <image tag name>`. Here are some useful options:
- **Running a docker container in the background**. By default a docker container when launched will run in the foreground, meaning you will see all output in the terminal and unable to continue using the terminal. For this reason in most cases it is convenient to run a docker container in the background using the `-d` flag (short for detached). Example: ```docker run -d csci442mines/student-env```
- **Assigning a name to your docker container**. Every docker container has a container ID and a container name which can be used to identify and run other commands on that container. If you do not give you container a name, it will be chosen randomly. Giving your container a chosen name upon launch will make it easier to run other commands on this container. Naming your container is done using the `--name` flag in the following format `docker run --name <container name> <image name>`. Example: ```docker run --name csci442-env csci442mines/student-env```
- **Creating a bind mount**. Docker containers and your host machine will have separate file systems through which files cannot be shared. If your CSCI 442 docker stops running on the computer all files within the docker ***will be erased***. To ensure your work inside the docker is saved it is ***HIGHLY*** recommended that you create a bind mount when launching your OS docker image. A bind mount will link all files within a specified folder on your host machine to a folder inside your docker container. This essentially creates a shared file space between the docker container and host machine. You can create a bind mount using the `--mount flag` with the format: ` docker run --mount type=bind,source=<path to folder on host>,target=<path to folder in container>`. Example: ```docker run --mount type=bind,source=C:\Users\ccrippey\os_ws,target=/root/projects csci442mines/student-env```
- **Running with an interactive terminal**. When launching a docker container, sometimes you will want to interact with files and programs inside that container from the terminal. To launch an interactive terminal with access to the inside of the docker container, use flags `-it` when running your container. Example: ```docker run -it csci442mines/student-env```. See next section for more on interactive terminals.
- **Auto removing the docker container**. By default when a docker container is killed, some artifacts of that container will remain in your computer system. To automatically remove this artifacts upon killing a container use the `--rm` flag. Example: ```docker run --rm csci442mines/student-env```. See next section for more information on removing docker containers.

Multiple flags can be used to achieve multiple affects.

#### Checking if your docker image is running
Once you have run your docker image, you can check whether it is running using `docker ps` in your terminal. The output lists containers, the container ID, image tag, and other information of the running docker containers.
After running the CSCI 442 docker you should see the following output:
```
CONTAINER ID   IMAGE                      COMMAND                  CREATED         STATUS         PORTS     NAMES
827db10a6ab4   csci442mines/student-env   "/bin/sh -c 'tail -f…"   3 seconds ago   Up 2 seconds             csci442-env
```

#### Enter the docker container from the terminal
After running your docker image, you might be wondering how we can see files and execute commands inside the docker. You can enter a docker container from the terminal using either:
- `docker exec -it <container ID> bash`. Example: `docker exec -it 827b bash`
- `docker exec -it <container name> bash`. Example: `docker exec -it csci442-env bash`

If you are unsure of the container name or container ID you can find these using `docker ps`.

After running this command you should see the following in your terminal.
```
C:\Windows\System32>docker exec -it csci442-env bash
root@827db10a6ab4:/#
```
This prompt is now inside your docker container. You can see the container ID (in this case 827db10...) in the terminal prompt. To see files inside the container, navigate the container, or run project code inside the container you can interact with this terminal like you would a normal Linux system.

#### Stopping a docker container
To stop a running docker container use either:
- `docker kill <container ID>`. Example: `docker kill 827b`
- `docker kill <container name>`. Example: `docker kill csci442-env`

**VERY IMPORTANT**: 
 The state inside a docker container ***will be LOST*** after killing the container. All files in the container which are not in a mounted folder ***will be LOST*** once a container is killed. To prevent losing your files, store all files in a folder which is associated with a bind mount.

#### Removing containers
After killing a container, artifacts of this container will remain on your system using up disk space. To see old exited containers use `docker ps -a`. You output should look like this:
```
CONTAINER ID   IMAGE                      COMMAND                   CREATED             STATUS                         PORTS     NAMES
827db10a6ab4   csci442mines/student-env   "/bin/sh -c 'tail -f…"    29 minutes ago      Exited (137) 5 seconds ago               csci442-env
```
To remove these old container use either:
- `docker rm <container ID>`. Example: `docker rm 827b`
- `docker rm <container name>`. Example: `docker rm csci442-env`

### Recommended setup for CSCI 442 environment
1. Follow these instruction to generate an ssh key for you github on your host machine: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
2. Create an CSCI 442 workspace folder on your host machine.
3. Navigate to you CSCI 442 workspace, inside this workspace folder clone the project repositoriy from github.
    ```
    C:\Users\<user>\csci442_ws>git clone git@github.com:CSCI-442-Mines/f23-project-1-<username>.git
    ```
4. Run the CSCI 442 docker image in the background and create a mount your CSCI 442 workspace on your computer
    ```
    docker run -d --rm --name csci442-env --mount type=bind,source=<path to csci442 workspace folder>,target=/root/projects csci442mines/student-env
    ```
5. Enter the CSCI 442 docker container
    ```
    docker exec -it csci442-env bash
    ```
6. Inside the docker container navigate to the `/root/projects` folder
    ```
    root@73ed9164ced7:/# cd /root/projects
    ```
7. Verify that your project repository is the the folder
    ```
    root@73ed9164ced7:~/projects# ls
    f23-project-1-<username>
    ```
8. Edit and run project code inside the docker container. Files will automatically be saved back to your CSCI 442 workspace folder on your host machine.

### HOW TO AVOID LOSING YOUR WORK

- ![#f03c15](https://placehold.it/150/f03c15/ffffff?text=WARNING) `Any file, including your project files, modified within a Docker image is volatile  (i.e., will go away after you stop the Docker container), UNLESS you use a properly configured "bind mount". Before you begin the project implementation, please make sure the files in your home folder are not lost by testing whether the bind works properly.`

- ![#f03c15](https://placehold.co/15x15/f03c15/f03c15.png) `As a second safety net, please use "git push" and "git commit" commands together, at the end of each programming session and more preferably periodically while you are coding.`

## Using Visual Studio Code
If you prefer a graphical IDE, [VSCode](https://code.visualstudio.com/) has excellent support for Docker. 

#### Prerequisites
- You've followed the basic docker setup tutorial described above
- You've [installed VSCode](https://code.visualstudio.com/)
- You've installed the "Remote Development" and "Docker" extensions within VSCode
#### Connecting to Your Container
1. Navigate to the Docker menu (A whale with cubes on the left side of the window)
2. Find `csci442mines/student-env` in the "Individual Containers" list. It should be in the "Containers" section at the top of the pane.
3. Right-click on `csci442mines/student-env` and select "Attach Visual Studio Code" (if you don't see that option, press "Start" in the right-click menu and try again)
4. You are now connected to the container and can use VSCode as normal. If you followed the docker setup instructions, your cloned repository should be in `/root/projects`.
### Debugging
VSCode allows you to graphically debug C and C++. Start by installing the "C/C++" extension. This extension will give you autocomplete and better syntax highlighting in addition to debugging capabilities. The debugger takes information about how to run your project from the file `.vscode/launch.json`.
#### Example Debugger Configuration
Create the file `.vscode/launch.json` and paste in the below.
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "(gdb) Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/reverse",
            "args": [ "tests/5.in" ],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}
```
#### Using the Debugger
The "Run and Debug" pane is accessed by clicking the play button covered by the bug on the left hand side of the window. Select `(gdb) Launch` to the right of the green play button, then press the button to start the debugger.

The debugger will pause on any breakpoints that have been set. To set breakpoints, right-click to the left of the line number on which you wish to break. The debugger will pause **before** that line is executed. The contents of variables will be displayed in the "Run and Debug" pane.

When the debugger is running, a control strip will appear.

![image](images/debugger_controls.png)

The function of each button (from left to right) is
- **Continue** - Execute normally until another breakpoint is reached
- **Step Over** - Execute the next line, then pause
- **Step Into** - Pause at the beginning of the function invoked by the current line
- **Step Out** - Execute the remainder of the current function, then pause after the line that called it
- **Restart** - Start the entire program over from the beginning
- **Stop** - Stop the program

#### Changing Debugger Behavior
The `launch.json` file given above will run project 1 with input `tests/5.in`. You will need to modify it to debug other projects or use other test cases. 

The `args` value sets command line arguments for the program being debugged. To test with the file `tests/4.in` instead of `tests/5.in`, change `args` to `[ "tests/4.in" ]`. The `args` value is an array, so you can have multiple values for projects that take more than one parameter (e.g. `[ "--some-flag", "tests/5.in" ]`).

To debug a different project, the name of the executable needs to be changed. This is controlled by the `program` value. The executable for project 1 is called `reverse` so `program` is set to `${workspaceFolder}/reverse`. For project 2, the executable is called `shell`, so `program` should be set to `${workspaceFolder}/shell`. 
