# Shopping Application Image Builder Project

This project automates the **AMI image building** and **infrastructure deployment** process using:

- **GitHub Actions**
- **Packer**
- **Terraform**
- **AWS EC2, VPC, Security Groups**

It supports **manual workflow dispatch** and can also be extended to trigger on push to `main` or `master`.

---

## 📌 Features
- Automated AMI creation using **Packer**
- Infrastructure deployment using **Terraform**
- GitHub Actions CI/CD pipeline
- Secure credential handling with GitHub Secrets
- Modular and scalable AWS infrastructure configuration

---

## 📂 Project Structure
```
shopping-application-image-builder-project/
│
├── main.tf
├── datasource.tf
├── variables.tf
├── versions.tf
├── packer/
│   ├── app-template.json
│   └── scripts/
│       └── install_dependencies.sh
├── .github/
│   └── workflows/
│       ├── infra-build.yaml
│       ├── infra-destroy.yaml
│       └── image-build.yaml
└── README.md
```

---

## 🏗️ Architecture Diagram (ASCII)

```
                +-----------------------------+
                |        GitHub Repo          |
                |  shopping-application-image |
                +--------------+--------------+
                               |
                               | Push / Dispatch
                               v
                     +---------+----------+
                     |   GitHub Actions   |
                     | (CI/CD Pipelines)  |
                     +----+---------+-----+
                          |         |
                          |         |
                          v         v
              +-----------+---+   +----------------+
              |   Packer      |   |  Terraform     |
              |  Build AMI    |   | Deploy Infra   |
              +-------+-------+   +--------+-------+
                      |                    |
               Creates AMI           Creates AWS Infra
                      |                    |
                      v                    v
         +------------+----+     +--------+----------------+
         |    AWS EC2      |     | AWS Resources (VPC, SG, |
         |  Instance with  |     | Subnets, Load Balancer) |
         |  Built AMI      |     +--------------------------+
         +-----------------+
```

---

## ⚙️ GitHub Actions Workflows

### **1️⃣ image-build.yaml**
Builds the Packer AMI.

```yaml
AWS_ACCESS_KEY_ID: ${{ secrets.access_key }}
AWS_SECRET_ACCESS_KEY: ${{ secrets.secrete_key }}
AWS_REGION: "ap-northeast-1"
PACKER_VERSION: "1.13.5"
```

---

### **2️⃣ infra-build.yaml**
Deploys the Terraform infrastructure.

---

### **3️⃣ infra-destroy.yaml**
Destroys all Terraform-created infrastructure.

---

## 🚀 How to Trigger Workflows

### **Manual Trigger (workflow_dispatch)**  
1. Go to **GitHub → Actions**  
2. Select the workflow  
3. Click **Run workflow**

---

### **Push Trigger Example**
To automatically run when pushing to `main` or `master`:

```yaml
on:
  push:
    branches:
      - main
      - master
```

---

## 🔑 Required GitHub Secrets

Go to:  
**Settings → Secrets and variables → Actions → New repository secret**

| Secret Name   | Description        |
|---------------|--------------------|
| access_key    | AWS Access Key     |
| secrete_key   | AWS Secret Key     |

---

## ▶️ How to Build Project Locally

### **1. Clone Repository**
```bash
git clone https://github.com/Fasil-devo-coder/shopping-application-image-builder-project.git
cd shopping-application-image-builder-project
```

### **2. Validate Terraform**
```bash
terraform init
terraform validate
terraform plan
```

### **3. Run Packer**
```bash
packer init packer/app-template.json
packer build packer/app-template.json
```

---

## 📞 Support
For any issues, open a GitHub issue or contact me.
+91 7306068637
sanjufasil12thbridge@gmail.com

---
