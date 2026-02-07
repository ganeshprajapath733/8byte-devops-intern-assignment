# Challenges Faced

## Terraform Provider and State Files
Initially, Terraform provider binaries and state files were accidentally committed to the Git repository.
This caused GitHub push failures due to large file size limits.

**Resolution:**  
The `.terraform` directory and state files were added to `.gitignore`.  
Git history was cleaned using `git-filter-repo`, and the repository was force-pushed with a clean history.

## EC2 SSH Access Issues
After provisioning the EC2 instance, SSH access initially failed due to an incorrect or missing key pair configuration.

**Resolution:**  
The correct AWS key pair was created and referenced in Terraform.  
File permissions and SSH command syntax were verified, resolving the access issue.

## Docker Build Failures
The Docker container initially failed to start due to syntax errors in the Node.js application and issues in `package.json`.

**Resolution:**  
Application syntax errors were fixed and `package.json` was corrected to valid JSON.  
The Docker image was rebuilt successfully and the container ran as expected.

## Container Exiting Immediately
After running the Docker container, it exited immediately with a non-zero status.

**Resolution:**  
Docker logs were inspected to identify runtime errors.  
Fixing the application syntax allowed the container to stay running and serve traffic correctly.

## Large Git Push Failures
GitHub rejected pushes due to large binary files exceeding size limits.

**Resolution:**  
Repository history was cleaned using `git-filter-repo`, and large files were completely removed before pushing again.
