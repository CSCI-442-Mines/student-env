### Checking if your docker image is running
Once you have run your docker image, you can check whether it is running using `docker ps` in your terminal. The output lists containers, the container ID, image tag, and other information of the running docker containers.
After running the CSCI 442 docker you should see the following output:
```
CONTAINER ID   IMAGE                      COMMAND                  CREATED         STATUS         PORTS     NAMES
827db10a6ab4   csci442mines/student-env   "/bin/sh -c 'tail -f…"   3 seconds ago   Up 2 seconds             csci442-env
```

### Enter the docker container from the terminal
After running your docker image, you might be wondering how we can see files and execute commands inside the docker. You can enter a docker container from the terminal using either:
- `docker exec -it <container ID> bash`. Example: `docker exec -it 827b bash`
- `docker exec -it <container name> bash`. Example: `docker exec -it csci442-env bash`

If you are unsure of the container name or container ID you can find these using `docker ps`.

After running this command you should see the following in your terminal.
```
root@827db10a6ab4:/#
```

This prompt is now inside your docker container. You can see the container ID (in this case 827db10...) in the terminal prompt. To see files inside the container, navigate the container, or run project code inside the container you can interact with this terminal like you would a normal Linux system.

### Stopping a docker container
To stop a running docker container use either:
- `docker kill <container ID>`. Example: `docker kill 827b`
- `docker kill <container name>`. Example: `docker kill csci442-env`

**VERY IMPORTANT**: The state inside a docker container ***will be LOST*** after killing the container. All files in the container which are not in a mounted folder ***will be LOST*** once a container is killed. To prevent losing your files, store all files in a folder which is associated with a bind mount.

### Removing containers
After killing a container, artifacts of this container will remain on your system using up disk space. To see old exited containers use `docker ps -a`. You output should look like this:
```
CONTAINER ID   IMAGE                      COMMAND                   CREATED             STATUS                         PORTS     NAMES
827db10a6ab4   csci442mines/student-env   "/bin/sh -c 'tail -f…"    29 minutes ago      Exited (137) 5 seconds ago               csci442-env
```
To remove these old container use either:
- `docker rm <container ID>`. Example: `docker rm 827b`
- `docker rm <container name>`. Example: `docker rm csci442-env`

