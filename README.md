# 🌍 Terraform - Infrastructure as Code (IaC)

Terraform is an **open-source Infrastructure as Code (IaC) tool** developed by HashiCorp. It allows developers to define and manage infrastructure using a **declarative configuration language (HCL - HashiCorp Configuration Language)**.

---

## 📌 Key Features of Terraform

### 🚀 1. Declarative Configuration

Terraform uses **HCL (HashiCorp Configuration Language)** to define infrastructure in a simple, human-readable format.

✅ **Define what you need, not how to do it**

✅ **Ensures consistency across environments**

✅ **Easily version and track changes**

### 🌱 2. Infrastructure as Code (IaC)

With Terraform, infrastructure is treated as **code**, allowing versioning, automation, and scalability.

✅ **Automate infrastructure provisioning**

✅ **Enable collaboration using Git**

✅ **Roll back to previous configurations**

### ☁️ 3. Multi-Cloud & Hybrid Support

Terraform works seamlessly with multiple **cloud providers and on-premise solutions**.

✅ **AWS, Azure, Google Cloud, OCI, DigitalOcean**

✅ **Kubernetes, VMware, OpenStack**

✅ **Hybrid & Multi-cloud deployments**

### 🔄 4. State Management

Terraform maintains the infrastructure **state** to track resources and changes.

✅ **Uses a state file (`terraform.tfstate`)**

✅ **Detects configuration drift**

✅ **Supports remote state storage (S3, Azure Blob, etc.)**

### 🔀 5. Modularity & Reusability

Terraform enables reusability of infrastructure using **Modules**.

✅ **Write once, use anywhere**

✅ **Share and maintain reusable components**

✅ **Terraform Registry provides prebuilt modules**

---

## 📜 Essential Terraform Commands

### 📂 1. Initializing a Terraform Project

```sh
terraform init  # Initialize Terraform in the current directory
```

### 🏗️ 2. Formatting and Validating Configuration

```sh
terraform fmt  # Format configuration files
terraform validate  # Validate the syntax
```

### 🔄 3. Planning & Applying Changes

```sh
terraform plan  # Show execution plan before applying changes
terraform apply  # Apply changes to the infrastructure
```

### 🛠️ 4. Destroying Resources

```sh
terraform destroy  # Remove all managed resources
```

### 🔄 5. Working with State

```sh
terraform state list  # Show resources in the state file
terraform state show <resource>  # Show details of a specific resource
```

---

## 🔧 Terraform Configuration Example

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```

---

## 🔗 Terraform Workflows

### 🏗️ 1. Write & Define Infrastructure

✅ Define infrastructure in **HCL**

### 📋 2. Plan & Preview Changes

✅ **Run `terraform plan`** to preview changes before applying

### 🚀 3. Apply Configuration

✅ **Run `terraform apply`** to create/update resources

### 🔄 4. Manage & Update Infrastructure

✅ Modify configurations and **reapply changes**

### 🛠️ 5. Destroy When No Longer Needed

✅ **Run `terraform destroy`** to clean up resources

---

## 🏆 Terraform Best Practices

### 🔐 1. Use Remote State Storage

✅ Store state in **S3, Azure Blob, GCS** for collaboration

### 📦 2. Organize Code with Modules

✅ Use **Terraform Modules** to structure large projects

### ⚡ 3. Use Workspaces for Environments

✅ Separate **dev, staging, and production** using workspaces

### 📜 4. Implement Version Control

✅ Track Terraform files using **Git (GitHub, GitLab, Bitbucket)**

---

## ☁️ Terraform Cloud & Enterprise

- **Terraform Cloud** – Managed Terraform with collaboration features
  
- **Terraform Enterprise** – Self-hosted version for large organizations

---
