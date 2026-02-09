# Approach

## Infrastructure Design
I used Terraform to create the AWS infrastructure so that everything could be set up in an automated and repeatable way.
Instead of creating resources manually in the AWS console, I defined them using Terraform.

I created a VPC with a public subnet to host the EC2 instance.
An Internet Gateway and route table were added so the instance can access the internet.

A security group was configured to allow only the required access:
- Port 22 for SSH, so I can connect to the server
- Port 3000 to allow users to access the Node.js application

## Application Deployment
The Node.js application was containerized using Docker so that it runs the same way in all environments.
The Docker image installs the required dependencies and runs the application on port 3000.

Docker was installed automatically on the EC2 instance using Terraform `user_data`.
This helped in making sure the server was ready to run containers immediately after it was created.

## CI/CD Strategy
I used GitHub Actions to set up a simple CI pipeline.
The workflow runs automatically on every push to the `main` branch and builds the Docker image.

This helped in verifying that the Dockerfile and application are working correctly after every code change.

## Version Control Practices
Terraform state files, provider binaries, and other generated files were excluded from Git using `.gitignore`.
This was done to avoid pushing unnecessary or sensitive files to the repository and to keep the codebase clean.
