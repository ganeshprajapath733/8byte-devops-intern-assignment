![CI](https://github.com/ganeshprajapath733/8byte-devops-intern-assignment/actions/workflows/main.yml/badge.svg)

# 8byte DevOps Intern Assignment

## Overview
This project demonstrates deploying a containerized Node.js application on AWS using Terraform and Docker, with CI automation via GitHub Actions.

## Tech Stack
- AWS EC2 (Ubuntu 22.04)
- Terraform (Infrastructure as Code)
- Docker
- GitHub Actions
- Node.js (Express)

## Architecture
- AWS EC2 instance in a public subnet
- Security group allowing SSH (22) and application traffic (3000)
- Dockerized Node.js application running on EC2
- CI pipeline to validate Docker builds

## Application
The application exposes a simple HTTP endpoint and confirms successful deployment.

**Live URL:**  
http://65.2.152.4:3000

## Infrastructure Provisioning
```bash
terraform init
terraform plan
terraform apply

## CI/CD
GitHub Actions runs a Docker build on every push to the `main` branch.

## Notes
Terraform state files and provider binaries are excluded from version control using `.gitignore`.
