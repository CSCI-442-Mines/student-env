# CSCI442 Student Environment
Student environment for CSCI442 programming projects
## Basic Docker Setup
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