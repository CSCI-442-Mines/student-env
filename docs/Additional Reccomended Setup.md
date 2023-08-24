TODO: rename this section to sth like "Settting up your projects inside the docker container"

TODO: *** Launching your docker container ***
0. TODO: First open a terminal in your host operating system (see: )
1. TODO: Within host terminal, access to your docker container , either in vscode (see: [[Using Visual Studio Code]]), or by running `docker exec -it operating_systems bash`. All commands in this part of the guide will use the terminal inside the container.


TODO: *** One time  github key setup ***
2. Follow [GitHub's guide for setting up SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux), make sure to use the Linux tab. Follow the sections under "Generating a new SSH key" and "Adding your SSH key to the ssh-agent".
	* Make sure to follow the guide for [adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).


TODO:  *** Per-project set up***
1. TODO: First, create a github project instance by clicking on the github classroom invitation in the canvas assignment 
2. Clone project starter files into your container
	```
	$ cd /root/projects; git clone git@github.com:CSCI-442-Mines/f23-project-1-<username>.git
	```

 TODO:
*** Developing your code ***
1. Your project files will be under /root/projects/f23-project-1-<username>.git
2. Run "make" to compile
3. Run the binary that is specific to the project. E.g. for project 1 it is "./reverse"
4. Implement the project via your favorite editor
5.  use "git push & git commit -a" commands together, at the end of each programming session and more preferably periodically while you are coding.
