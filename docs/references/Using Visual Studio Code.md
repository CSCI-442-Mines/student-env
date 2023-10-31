If you prefer a graphical IDE, [VSCode](https://code.visualstudio.com/) has excellent support for Docker. 

### Setup

#### Prerequisites
- You've followed the first step for setup, [[Installing Docker]].
- You've [installed VSCode](https://code.visualstudio.com/)
- You've installed the "Remote Development" and "Docker" extensions within VSCode
	- Extensions can be found under the tab that looks like this:
	  ![[Pasted image 20230823220337.png]]
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

![[debugger_controls.png]]

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
