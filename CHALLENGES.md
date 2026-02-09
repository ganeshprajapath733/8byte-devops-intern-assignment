# Challenges Faced

## Terraform provider and state files
 Initially i had accidentally committed the terraform binaries and state files to the git repository.
 This caused git push failures when i was trying to push the code from local machine to github.

**Solution**
The .terraform directory and state files were added to .gitignore,So in order to clean the git history
i used git filter repo which force-pushed with a clean history

## EC2 Access Issue
After setting the ec2 instance on aws,while i was trying to ssh into the server,it failed because i used the old key pair

**Solution**
Created a new aws key pair and allowed the permissions and the tried and i was able to ssh to the server

## Docker Build Failure
The docker container initially failed to start because of the syntax errors in node.js application and missing some lines in package.json

**Solution**
Fixed the syntax and checked all the lines and verified json file.Then the docker image was rebuilt successfully and container ran.

## Container Exiting Immediately
After running the Docker container,it exited immediately with a non-zero status.

**Solution**  
Checked Docker logs and identified the runtime errors.Fixed the application syntax and it allowed the container to run.

## Large Git Push Failures
GitHub rejected pushes due to large binary files exceeding size limits.

**Solution**  
Repository history was cleaned using `git-filter-repo`, and large files were completely removed before pushing again.
