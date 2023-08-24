Before following this guide, you need access to your Docker container's terminal in order to run these commands. The reference guide, [[Opening a Docker Container's Terminal]] will help with this.


### One time  GitHub key setup
1. Follow [GitHub's guide for setting up SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux), make sure to use the Linux tab. Follow the sections under "Generating a new SSH key" and "Adding your SSH key to the ssh-agent".
2.  Make sure to follow the guide for [adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) if you haven't already.
	* Note: to print your public key (note: do not print or copy your private key... EVER!), you can run: `cat ~/.ssh/id_rsa.pub`;
	* For example (throwaway, good luck using this key for anything).
		![[Pasted image 20230823222945.png]]


### Per-project Setup
1. Create a github project instance by clicking on the github classroom invitation in the canvas assignment 
2. Clone project starter files into your container
	```
	$ cd /root/projects; git clone git@github.com:CSCI-442-Mines/f23-project-1-<username>.git
	```

### Developing your code
1. After cloning the project, your project files will be under `/root/projects/f23-project-1-<username>.git`.
2. Compile your code by running `$ make`.
3. Run the binary that is specific to the project (for project 1 it is `./reverse`).
4. Implement the project via your favorite editor (guides here are supplied for VSCode, see [[Using Visual Studio Code]]).
5. At the end of any programming session, or whenever you make any progress you want to save (feature complete, partially implemented, or you just don't want to lose work), run `git commit -a && git push` in order to save your changes to you git repository. 
	* We STRONGLY recommend doing this frequently, so you do not lose your work.
	* It happens every semester where someone forgets to commit some major work and loses several hours of work, you don't want to be that person.
6. Take your screenshot to upload to deliverable 1 once the D1 requirements are complete.
