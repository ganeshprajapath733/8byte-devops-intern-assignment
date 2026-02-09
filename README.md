![CI](https://github.com/ganeshprajapath733/8byte-devops-intern-assignment/actions/workflows/main.yml/badge.svg)

# 8byte DevOps Intern Assignment

## Overview
In this project i have demonstrated the assignment of deploying a containerised Node.js application on AWS using DevOps.
It covers infrastructure as code using Terraform,containerization using Docker,Cloud deployment on aws ec2 and CI automation with Github actions

## Architecture
User : AWS Ec2(ubuntu 22.04),Docker container,Node.js Application(port 3000)
Components of AWS used : VPC,Public subnet,internet gateway,route table,security group,ec2 instance

## Tech Stack
-Cloud Provider : AWS
-Infrastrucutre as Code : Terraform
-Containerization : Docker
-CI/CD : GitHub actions
-Application framework : Node.js
-OS : Ubuntu(22.04)

## Application setup (local/system)
Installed the node.js and npm
-To Run application,we have to use the below commands
->npm install
->node app.js

Then we can verify weather the application is running or not at local host port 3000 (http://localhost:3000)

## To build Docker image
-In order to build a docker image we have to run the below command
->docker build -t 8byte-intern-app
And then to run the Docker container
->docker run -p 3000:3000 8byte-intern-app (then we can verify it at port 3000)

## Infrastructure provisioning using terraform
The terraform directory strucutre is shown below:
terraform/
|-main.tf
|-variables.tf
|-outputs.tf
|-provider.tf
|-terraform.tf

-The terraform commands used are:
-> terraform init , terraform plan , terraform apply

## Steps for Deploying application on Ec2
-ssh into ec2 instance with the command (ssh -i locationof8byte-key.pem ubuntu@publicipaddress)
-We then verify the docker version (docker --version)
-Then clone the github repo (git clone http://github.com/ganeshprajapath733/8byte-devops-intern-assignment.git)
-Then we build a docker image (docker build -t 8byte-intern-app)
-At last we run the container (docker run -d -p 3000:3000 8byte-intern-app)
Then we can verify the application running at port 3000

## CI/CD using github actions
-The trigger will be done to the main branch on every push,also it check the repo code,builds the docker image and application build
(The workflow location : .github/workflows/main.yml)

## Screenshots
1.Terraform apply output
![terraform-apply png](https://github.com/user-attachments/assets/69f5fdf8-c662-4442-9f53-73d2e95adda9)
2.EC2 instance running
![ec2-running png](https://github.com/user-attachments/assets/e7f0c50a-ca85-4e4e-a0a7-81b4bad1cc6e)
3.Application Running in browser
![app-browser png](https://github.com/user-attachments/assets/d9b98c68-6645-473e-bd5e-eea75d4e8df2)
4.Github actions CI successful
![github-actions-success png](https://github.com/user-attachments/assets/8334e552-c228-441b-8230-abbb103a0878)

## Notes
-Terraform files and binary files are excluded by using .gitignore
-CI pipeline shows the issue and resolution and the final build state
-Security Group allows access to requried ports only.
