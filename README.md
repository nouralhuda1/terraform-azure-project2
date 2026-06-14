# terraform-azure-project2

## Project Overview

This project demonstrates Infrastructure as Code (IaC) using Terraform to deploy a containerized web application on Microsoft Azure using Azure Container Instances (ACI). The application is containerized using Docker and deployed using a CI/CD pipeline with GitHub Actions.

The pipeline automates infrastructure provisioning and deployment to Azure.

---

## Authors

- Name: nour alhuda ahmed husayn, saja saleh ghazal
- Student IDs: 4983, 5173

---

## Architecture

Workflow:
Docker → Docker Hub → GitHub Actions → Terraform → Azure (ACI) → Running Web App

Steps:
- Application is containerized using Docker
- Docker image is pushed to Docker Hub
- GitHub Actions triggers Terraform pipeline
- Terraform creates Azure Resource Group and Azure Container Instance
- ACI pulls Docker image and runs the application

---

## Docker

Build image:
docker build -t ruerue11/project2-aci:latest .

Run locally:
docker run -p 80:80 ruerue11/project2-aci:latest

Push to Docker Hub:
docker login
docker push ruerue11/project2-aci:latest

---

## Terraform

Initialize:
terraform init

Validate:
terraform validate

Plan:
terraform plan

Apply:
terraform apply -auto-approve

---

## Azure Resources

Terraform creates:
- Resource Group
- Azure Container Instance (ACI)
- Public IP / DNS for access
- Running container from Docker Hub image

---

## CI/CD Pipeline (GitHub Actions)

- On Pull Request:
  Runs terraform plan

- On push to main:
  Requires manual approval
  Runs terraform apply

Authentication uses:
- GitHub Secret: AZURE_CREDENTIALS (Azure Service Principal JSON)

---

## Outputs

Terraform outputs:
- Resource Group name
- Container public FQDN
- Container public IP

---

## Summary

This project includes:
- Docker containerization
- Terraform Infrastructure as Code
- Azure Container Instance deployment
- GitHub Actions CI/CD pipeline
- Secure Azure authentication using Service Principal