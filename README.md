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
7. screenshots

<img width="1512" height="982" alt="Screenshot 2026-06-14 at 10 43 57 PM" src="https://github.com/user-attachments/assets/a3018ed7-7e1a-4d31-a0dc-cde882a6f69a" />

<img width="1512" height="982" alt="Screenshot 2026-06-14 at 10 59 49 PM" src="https://github.com/user-attachments/assets/501023d3-e7da-4ee8-8b1d-881ff184bc6d" />

<img width="1512" height="982" alt="Screenshot 2026-06-14 at 11 50 09 PM" src="https://github.com/user-attachments/assets/a99b66b7-e125-4f66-823b-9bd3fcbf6fe7" />

<img width="1512" height="982" alt="Screenshot 2026-06-14 at 11 51 57 PM" src="https://github.com/user-attachments/assets/49bc60e6-8be4-46dc-bbc8-ebf3a6065388" />

<img width="1512" height="982" alt="Screenshot 2026-06-15 at 2 29 59 AM" src="https://github.com/user-attachments/assets/febdb62c-7b74-419d-9efc-f232caa214e6" />

<img width="1512" height="982" alt="Screenshot 2026-06-15 at 12 05 24 AM" src="https://github.com/user-attachments/assets/dc669617-7163-4642-a8da-7ecf06d29d22" />

<img width="1512" height="982" alt="Screenshot 2026-06-15 at 2 30 47 AM" src="https://github.com/user-attachments/assets/41e0f954-3e7f-42a9-8a11-9fa0e3d58c97" />


8. Step-by-Step Implementation
### Step 8.1: Create Project Repository

```bash

git clone <your-repo-url>

cd terraform-azure-project2

Step 8.2: Create Web Application

Create app/index.html:
<!DOCTYPE html>
<html>
<head>
    <title>Project 2 ACI</title>
</head>
<body>
    <h1>Hello from Terraform + Azure ACI</h1>
    <p>Deployed by: YOUR NAME</p>
</body>
</html>

Step 8.3: Create Dockerfile
FROM nginx:alpine
COPY app/index.html /usr/share/nginx/html/index.html

Step 8.4: Build Docker Image
  docker build -t your-dockerhub-username/project2-aci:latest .

Step 8.5: Push Docker Image to Docker Hub
   docker login
docker push your-dockerhub-username/project2-aci:latest

Step 8.6: Configure Terraform Files

Create required files:

* providers.tf
* main.tf
* variables.tf
* outputs.tf
* backend.tf

These define:

* Azure Resource Group
* Azure Container Instance (ACI)
* Docker image deployment
* Outputs (IP, FQDN)

Step 8.7: Initialize Terraform
  terraform init -reconfigure

Step 8.8: Deploy Infrastructure
    terraform plan
terraform apply -auto-approve

Step 8.9: Verify Deployment
    terraform output
    Check Azure Portal:

* Resource Group exists
* Container Instance is running
* Public IP or DNS is available

Step 8.10: Test Application

Open in browser:

http://<ACI_PUBLIC_IP_OR_FQDN>

Verify that the web page loads successfully.

⸻

Step 8.11: Configure GitHub Actions CI/CD

Create .github/workflows/terraform.yml with:

* Terraform Plan on Pull Request
* Terraform Apply on Push to Main
* Azure authentication using AZURE_CREDENTIALS secret

Step 8.12: Trigger CI/CD Pipeline
git add .
git commit -m "final deployment setup"
git push origin main

Check GitHub Actions:

* Terraform Plan runs successfully
* Terraform Apply runs successfully (with approval if enabled)

⸻

Step 8.13: Final Verification

* Azure Container Instance is running
* Docker image is pulled from Docker Hub
* Web application is publicly accessible
* Terraform state is correctly managed
* CI/CD pipeline executed successfully


9. Repository Link
https://github.com/nouralhuda1/terraform-azure-project2.git
