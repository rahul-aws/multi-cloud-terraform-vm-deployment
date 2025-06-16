# 🚀 Multi-Cloud VM Deployment with Terraform (GCP - YAML Based)

Provision secure, private virtual machines in Google Cloud using **modular Terraform** with **YAML-driven config**—engineered for DevOps engineers targeting **production-grade infra**, **platform engineering best practices**, and **portfolio building**.

---

## 📁 Project Structure

```
gcp/
├── modules/
│   ├── vpc/            # VPC and Subnet
│   ├── firewalls/      # Firewall Rules (SSH/IAP)
│   ├── nat/            # Cloud NAT + Router
│   └── vm/             # Compute VM with service account
├── config.yaml         # 🧠 Central configuration (YAML-based input)
├── main.tf             # Root module loader
├── variables.tf        # Reads decoded YAML into modules
├── outputs.tf          # Key outputs (e.g., VM IP)
└── README.md           # This file
```

---

## 📘 YAML Configuration (`config.yaml`)

```yaml
vpc:
  vpc_name: "my-custom-vpc"
  auto_subnet: false

project: "<your-project-id>"

subnet:
  name: "private"
  region: "us-central1"
  ip_cidr_range: "10.2.0.0/28"
  network: "my-custom-vpc"

vm:
  account_id: "custom-sa"
  name: "test-vm"
  zone: "us-central1-a"
  tags:
    - "test"
    - "ssh"

firewall:
  name: "ssh-custom"
  source_ranges:
    - "35.235.240.0/20"

nat:
  name: "test-custom"
```

---

## ⚙️ How to Use

> Just update `config.yaml`. Everything else is wired through `yamldecode()`—zero tfvars needed.

### 1️⃣ Initialize Terraform

```bash
cd gcp/
terraform init
```

### 2️⃣ Plan Your Infrastructure

```bash
terraform plan
```

### 3️⃣ Apply to Deploy

```bash
terraform apply
```

---

## 🔧 Root Logic in `main.tf`

```hcl
locals {
  config = yamldecode(file("${path.module}/config.yaml"))
}
```

And modules like:

```hcl
module "vpc" {
  source       = "./modules/vpc"
  vpc_name     = local.config.vpc.vpc_name
  auto_subnet  = local.config.vpc.auto_subnet
  project_id   = local.config.project
}
```

---

## 🧱 Module Breakdown

| Module      | Description                                        |
|-------------|----------------------------------------------------|
| `vpc/`      | Creates custom VPC and subnet                      |
| `firewalls/`| Manages SSH/IAP firewall rules                     |
| `vm/`       | Deploys private GCE instance with service account  |
| `nat/`      | Adds Cloud NAT & Router for internet egress        |

---

## ✅ Benefits

- 🧠 YAML-first config: easy to manage & extend  
- 🔁 Multi-cloud portable (Azure & AWS ready)  
- 🔐 Private VMs only — IAP + NAT = secure setup  
- ⚙️ Scalable module structure — ideal for enterprise patterns  
- 🧪 Great DevOps side-project or showcase

---

## 📈 Ideal Use Cases

- GCP Infra-as-Code Projects  
- DevOps Interview Prep  
- Multi-cloud portfolio building  
- Platform Engineering foundations

---

## 🧭 Roadmap

- [ ] Azure module parity  
- [ ] Prometheus + Grafana monitoring  
- [ ] GitHub Actions CI/CD Integration  
- [ ] Resume/portfolio README + Architecture Diagrams  
- [ ] Interview prep extension (k8s + CI pipelines)

---

## 👤 Author

**Rahul — DevOps Engineer**  
CKA | Terraform | GCP | AWS | Infra Security  
🔗 [Portfolio](https://rahul-aws.github.io/) · [GitHub](https://github.com/rahul-aws) . [Linkedin](www.linkedin.com/in/rahul-kumar-84518b186)

---

## ⚡️ Pro Tip

Push this project to GitHub with a clean commit history, and you've got yourself a **portfolio-grade, interview-ready DevOps asset**. Show hiring managers or clients that you're not just learning tools—you're building infrastructure like a pro.

