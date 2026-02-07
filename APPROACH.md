
# Approach

## Infrastructure Design
Terraform was used to create AWS infrastructure in an automated and repeatable way.
A custom VPC with a public subnet was created to host the EC2 instance.
An Internet Gateway and route table were configured to allow public internet access.

A security group was added to allow:
- SSH access on port 22 for server management
- Application access on port 3000 for the Node.js service

## Application Deployment
The Node.js application was containerized using Docker to ensure consistency and portability.
The Docker image installs dependencies and runs the application on port 3000.

Docker was installed automatically on the EC2 instance using Terraform `user_data`, ensuring the instance was ready to run containers immediately after provisioning.

## CI/CD Strategy
GitHub Actions was used to implement continuous integration.
On every push to the `main` branch, the workflow builds the Docker image to continuously validate application and Dockerfile integrity.

## Version Control Practices
Terraform state files, provider binaries, and other generated artifacts were excluded from version control using `.gitignore` to follow infrastructure security and best practices.
