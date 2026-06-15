# Infrastructure as Code with Terraform and Azure ACI

---

## 1. Author Information

- Names: [Nour alhuda ahmed husayn, saja saleh ghazal
- Student IDs: 4983, 5173
---

## 2. Project Title and Description

**Project Title:** Infrastructure as Code with Terraform and Azure Container Instances (ACI)

This project demonstrates how to deploy a containerized web application using Docker, Terraform, and Azure Container Instances (ACI). The infrastructure is automated using Infrastructure as Code (IaC) and deployed through a CI/CD pipeline using GitHub Actions.

The system builds a Docker image, pushes it to Docker Hub, and deploys it to Azure using Terraform.

---

3. attached

4. # Docker Image Build and Push Instructions

### Step 1: Build Docker Image
docker build -t ruerue11/project2-aci:latest .

---

### Step 2: Run Container Locally
docker run -p 80:80 ruerue11/project2-aci:latest

---

### Step 3: Login to Docker Hub
docker login

---

### Step 4: Push Image to Docker Hub
docker push ruerue11/project2-aci:latest

---

### Notes
- The Docker image must be successfully pushed before running Terraform.
- Ensure Docker Hub repository exists and you are logged in.

5. ## Terraform Setup Instructions

### Step 1: Initialize Terraform
terraform init

---

### Step 2: Validate Configuration
terraform validate

---

### Step 3: Plan Infrastructure
terraform plan

---

### Step 4: Apply Infrastructure
terraform apply -auto-approve

---

## What Terraform Creates

- Azure Resource Group
- Azure Container Instance (ACI)
- Public IP / DNS name for access
- Container running Docker image from Docker Hub

---

## Notes

- Ensure Azure credentials are configured in GitHub Secrets (AZURE_CREDENTIALS)
- Terraform backend should be configured in Azure Storage (if required by project setup)
- Always run `plan` before `apply` to verify changes

6. GitHub Actions Workflow Explanation

The CI/CD pipeline automates deployment using GitHub Actions.

Workflow Steps:

* On Pull Request:
    * Runs terraform plan to preview infrastructure changes
* On Push to main:
    * Requires manual approval (production environment)
    * Runs terraform apply to deploy infrastructure

Authentication:

* Uses GitHub Secret: AZURE_CREDENTIALS
* This secret contains Azure Service Principal credentials for authentication

⸻
7. 
attached
8. Step-by-Step Implementation

Step 1: Docker Setup

* Create Dockerfile
* Build and run container locally
* Push image to Docker Hub

Step 2: Terraform Setup

* Define Azure provider
* Create Resource Group
* Create Azure Container Instance
* Configure outputs

Step 3: Backend Configuration

* Configure Terraform backend using Azure Storage Account for state management

Step 4: CI/CD Setup

* Create GitHub Actions workflow file
* Configure plan on PR
* Configure apply on push
* Add Azure credentials secret

Step 5: Deployment

* Push code to GitHub
* Trigger workflow
* Approve deployment (if required)
* Verify Azure resources

9. Repository Link
https://github.com/nouralhuda1/terraform-azure-project2.git