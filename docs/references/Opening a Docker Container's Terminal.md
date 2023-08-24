### VSCode Terminal
1. Follow the instructions under [[Using Visual Studio Code#Setup]].
2. On the top header bar, click `Terminal > New Terminal`.
	* What is shown on my computer as Ctrl+Shift+\` is the keyboard shortcut I can use to create a new terminal. Learn whatever shortcut your computer has for faster access!
	![[Pasted image 20230823220954.png]]
3. You should now have a terminal inside VSCode that is running bash!
	![[Pasted image 20230823221357.png]]

### Other Terminals
If you decide not to use VSCode (we HIGHLY recommend you do for your ease during this class), you will have to access the Docker container terminal through your Operating Systems terminal. These are as follows:
* Windows: cmd (aka Command Prompt)
* MacOS: terminal
* Linux: depends on the Linux distribution. If you are using Linux, you should know this :).

1. Open your terminal.
2. If you have not already started your Docker container, run:
	```
	$ docker start operating_systems```
	```

	* You can check this, see: [[Additional Docker-foo#Checking if your docker container is running]].
1. Once your docker container is running, run:
	```
	$ docker exec -it operating_systems bash
	```
	Which will open a new bash shell, from within the docker container!
	![[Pasted image 20230823222338.png]]