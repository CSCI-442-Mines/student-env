### Graceful Exit
While your changes will most likely be saved to disk, it is never good to risk an abrupt shutdown of anything when avoidable. There may be some process that is accessing a file, and an abrupt shutdown may corrupt that file (and your work).

In order to avoid this, you can gracefully shut your docker container down by either running `docker stop operating_systems`, or by right clicking the container in the VSCode docker tab, and pressing "Stop". In either case, wait for the Docker container to completely stop before continuing (for vscode, wait for the icon to go to a red square, for terminal, wait for a new line to appear for continued terminal input, indicating that the docker stop command completed).


### Use Git!!!!
You learned this in software engineering for a reason! Git is an essential tool for software development, and should be used frequently. Fortunately, you don't have to worry about merge conflicts in this course, so you can just commit, push, and move on :).

In case you forgot how to do so, you can commit and push your changes by running.
```
$ git commit -a && git push
```

If you are using VSCode, you can also use the handy source control interface for handling git. Here is a [tutorial](https://code.visualstudio.com/docs/sourcecontrol/overview).


### Do not delete your Docker container!!!!!
If you have a circumstance where you feel you may need to delete the container, you may want to ask a TA first. Deleteing a container deletes the files in the container, including anything not synced to Git or to your local machine, such as configuration files for vscode, vim, ssh/git, etc..

If you accidentally delete your Docker container, you will have to restart this guide, and hope that you took the proper measures to ensure no data loss.

### Do not delete the OS_projects folder on your local device
This is where the projects should sync with your local computer's file system if you are properly set up. Deleting this may be worse than deleting the Docker container, because it contains all of your work that is not synced to Git. Don't do it!
