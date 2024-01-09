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