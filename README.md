# 🚀 End-to-End Infrastructure & Cloud Automation Lab

![DevOps CI Pipeline](https://github.com/itamar39/devops-learning-lab/actions/workflows/ci-pipeline.yml/badge.svg)
![Infrastructure as Code](https://img.shields.io/badge/IaC-Terraform-purple)
![Config Management](https://img.shields.io/badge/Ansible-Automation-red)
![Orchestration](https://img.shields.io/badge/Kubernetes-K8s-blue)

## 📌 Overview
This repository demonstrates a fully automated, end-to-end DevOps infrastructure deployment model. It combines **Infrastructure as Code (IaC)**, **Configuration Management**, **Containerization**, and **Kubernetes Orchestration**, backed by an automated **CI/CD Pipeline** using GitHub Actions.

---

## 🏗️ Architecture & Workflow

```mermaid
graph TD
    A[Developer Push] -->|Git Trigger| B[GitHub Actions CI Pipeline]
    
    subgraph CI/CD Quality Gates
        B --> C[Hadolint: Docker Validation]
        B --> D[Terraform: Validate & Init]
        B --> E[Ansible: Syntax Check]
        B --> F[K8s: Manifest Validation]
    end
    
    C & D & E & F -->|All Pass| G[Deployment Ready State]
    
    G --> H[1. Terraform: Provision Nodes]
    H --> I[2. Ansible: Configure Nginx & Runtime]
    I --> J[3. Kubernetes: Deploy Applications & Services]