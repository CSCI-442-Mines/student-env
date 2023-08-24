
1. Open a terminal, either in vscode (see: [[Using Visual Studio Code]]), or by running `docker exec -it operating_systems bash`. All commands in this part of the guide will use the terminal inside the container.
2. Follow [GitHub's guide for setting up SSH keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux), make sure to use the Linux tab. Follow the sections under "Generating a new SSH key" and "Adding your SSH key to the ssh-agent".
	* Make sure to follow the guide for [adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).
3. Navigate to you CSCI 442 workspace, inside this workspace folder clone the project repository from GitHub.
	```
	$ cd projects; git clone git@github.com:CSCI-442-Mines/f23-project-1-<username>.git
	```
