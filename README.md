# CSCI442 Student Environment
Student environment for CSCI442 programming projects
## Basic Docker Setup
### Download Docker Engine
First download and setup Docker Engine using the instructions at the link below for you OS:
- Windows: https://docs.docker.com/desktop/install/windows-install/
- Mac: https://docs.docker.com/desktop/install/mac-install/
- Linux: https://docs.docker.com/desktop/install/linux-install/

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

### Downloading up the CSCI 442 docker
You will need to download the os docker image from the Docker Hub. To do this open your terminal and run:
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
Once you have the CSCI 442 docker downloaded you are ready to start using this docker.####

#### Running a docker image
You can run any available image using: `docker run <image tag name>`. Here are some useful options:
- **Running a docker container in the background**. By default a docker container when launched will run in the foreground, meaning you will see all output in the terminal and unable to continue using the terminal. For this reason in most cases it is convenient to run a docker container in the background using the `-d` flag. Example: ```docker run -d csci442mines/student-env```
- **Assigning a name to you docker container**. Every docker container has a container ID and a container name which can be used to identify and run other commands to manipulate that container. Giving your container a choosen name upon launch it easier to run other commands on this container. Naming your container is done using the `--name` flag in the following format `docker run --name <name> <image name>`. Example: ```docker run --name csci442 csci442mines/student-env```
- **Creating a bind mount**. Docker containers and your host machine will have separate file systems through which files cannot be shared. If your CSCI442 docker stops running on the computer all files within the docker ***will be erased***. To ensure your work inside the docker is saved it is ***HIGHLY*** recommended that you create a bind mount when launching your OS docker image. A bind mount will link all files within a specified folder on your host machine to a folder in your docker container. This essentially creates a shared file space between you docker and host machine. You can create a bind mount using the `--mount flag` with the format: ` docker run --mount type=bind,source=<path to folder on host>,target=<path to folder in container>`. Example: ```docker run --mount type=bind,source=C:\Users\ccrippey\os_ws,target=/root/projects csci442mines/student-env```
- **Running with an interactive terminal**. When launching a docker container, sometimes you will want to interact will files and programs inside that container from the terminal. To launch an interactive terminal with access to the inside of the docker container, use flags `-it` when running your container. Example: ```docker run -it csci442mines/student-env```. See next section for more on interactive terminals.
- **Auto removing the docker container**. By default when a docker container is killed, some artifacts of that container will remain in your computer system. TO automatically remove this artifacts upon killing a container use the `--rm` flag. Example: ```docker run --rm csci442mines/student-env```. See next section for more information on removing docker containers.

Multiple flags can be used to achieve multiple affects.

#### Checking if your docker image is running
Once you have run your docker image, you can check whether it is running using `docker ps` in your terminal. The output lists container the container ID, image tag, and other information of the running docker containers.
After running the CSCI 442 docker you should see the following output:
```
CONTAINER ID   IMAGE                      COMMAND                  CREATED         STATUS         PORTS     NAMES
827db10a6ab4   csci442mines/student-env   "/bin/sh -c 'tail -f…"   3 seconds ago   Up 2 seconds             csci442-docker
```

#### Enter the docker container from the terminal
After running your docker image, you might be wondering how we can see files and execute commands inside the docker. You can enter a docker container from the terminal using either:
- `docker exec -it <container ID> bash`. Example: `docker exec -it 827b bash`
- `docker exec -it <container name> bash`. Example: `docker exec -it csci442-docker bash`

If you are unsure of the container name or container ID you can find these using `docker ps`.

After running this command you should see the following in your terminal.
```
C:\Windows\System32>docker exec -it csci442-docker bash
root@827db10a6ab4:/#
```
This prompt is now inside your docker container. You can see the container ID (in this case 827db10...) in the terminal prompt. To see files inside the container, navigate the container, or run command and programs inside the container you can interact with this terminal like you would a normal linux system.

#### Stopping a docker container
To stop a running docker container use either:
- `docker kill <container ID>`. Example: `docker kill 827b`
- `docker kill <container name>`. Example: `docker kill csci442-docker`

**VERY IMPORTANT**: The state inside a docker container ***will be LOST*** after killing the container. All files in the container which are not in a mounted folder ***will be LOST*** once a container is killed. To prevent loosing your files, store all files in a folder which is associated with a bind mount.

#### Removing containers
After killing a container, artifacts of this container will remain on your system using up disk space. To see old exited containers use `docker ps -a`. You output should look like this:
```
CONTAINER ID   IMAGE                      COMMAND                   CREATED             STATUS                         PORTS     NAMES
827db10a6ab4   csci442mines/student-env   "/bin/sh -c 'tail -f…"    29 minutes ago      Exited (137) 5 seconds ago               csci442-docker
```
To remove these old container use either:
- `docker rm <container ID>`. Example: `docker rm 827b`
- `docker rm <container name>`. Example: `docker rm csci442-docker`

### Recommended setup for OS environment
1. Follow these instruction to generate an ssh key for you github: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
2. Create an CSCI 442 workspace folder on your host machine.
3. Navigate to you CSCI 442 workspace, inside this workspace folder clone the project repositoriy from github.
    ```
    C:\Users\USER\csci442_ws>git clone git@github.com:CSCI-442-Mines/f23-project-1-<username>.git
    ```
4. Run the csci442 docker image in the background and create a mount your CSCI 442 workspace on your computer
    ```
    docker run -d --rm --name csci442-env --mount type=bind,source=<path to csci442 workspace folder>,target=/root/projects csci442mines/student-env
    ```
5. Enter the csci442 docker container
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



## Using Visual Studio Code
If you prefer a graphical IDE, [VSCode](https://code.visualstudio.com/) has excellent support for Docker. 

#### Prerequisites
- You've followed the basic docker setup tutorial described above
- You've [installed VSCode](https://code.visualstudio.com/)
- You've installed the "Remote Development" and "Docker" extensions within VSCode
#### Steps
1. Navigate to the Docker menu (A whale with cubes on the left side of the window)
2. Find `csci442mines/student-env` in the "Individual Containers" list. It should be in the "Containers" section at the top of the pane.
3. Right-click on `csci442mines/student-env` and select "Attach Visual Studio Code" (if you don't see that option, press "Start" in the right-click menu and try again)
4. You are now connected to the container and can use VSCode as normal. We suggest you do your work in the `/root/projects` folder win the container.
## Debugging Your Code
