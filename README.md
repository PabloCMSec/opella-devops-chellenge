# 🚀 Opella DevOps Technical Challenge: Azure Infrastructure with Terraform

## ☁️ Terraform Project: Azure Infrastructure Foundation

This project showcases Infrastructure as Code (IaC) best practices using Terraform on Microsoft Azure. It is designed to deploy multiple environments (`dev`, `prod`) and can easily scale to additional regions or resources.

Included:

- Reusable **VNET module** with public and private subnets.
- **Storage Account** for blob storage and remote state backend.
- **Ubuntu Virtual Machine** with password-based authentication.
- Environment separation using branches and `.tfvars` files.
- Automated deployment via **GitHub Actions**.

---

## 📁 Project Structure

```bash
.
├── main/
│   ├── arch.tf             # Architecture composition
│   ├── dev.tfvars          # Dev environment variables
│   ├── prod.tfvars         # Prod environment variables
│   ├── locals.tf           # Environment-local settings
│   ├── outputs.tf          # Module outputs
│   ├── variables.tf        # Global input variables
│   ├── versions.tf         # Backend, provider and version requirements
├── modules/
│   ├── rsg/                # Resource Group module
│   ├── vnet/               # Virtual Network module
│   ├── sta/                # Storage Account module
│   └── ubuntu-vm/          # Ubuntu VM module
├── env/
│   ├── dev.backend.tfvars  # Remote backend config for dev
│   └── prod.backend.tfvars # Remote backend config for prod
└── .github/
    └── workflows/
        └── deploy.yml      # CI/CD pipeline
```

---

## ⚙️ CI/CD Automation

This project uses **GitHub Actions** to run Terraform plans automatically:

- On **`dev`** branch → uses `dev.tfvars`
- On **`main`** branch → uses `prod.tfvars`
- Remote backend uses `LexIA` resource group and `stalexia` storage account.
- State files are stored in separate keys for each environment.

---

## ▶️ Manual Usage

### Dev environment:

```bash
terraform init -backend-config="../env/dev.backend.tfvars"
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

### Prod environment:

```bash
terraform init -backend-config="../env/prod.backend.tfvars"
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```

---

## 📦 Modules Overview

| Module       | Description                                 |
|--------------|---------------------------------------------|
| `rsg`        | Resource Group with environment-based tags  |
| `vnet`       | VNET with public/private subnets and NSGs   |
| `sta`        | Storage Account for blobs and remote state  |
| `ubuntu-vm`  | Ubuntu VM with password authentication       |

All modules support tags and environment/region-specific naming.

---

## 📤 Outputs

Exported values include:

- Resource Group name and ID
- VNET name, ID, and address space
- Subnet and NSG IDs
- Storage Account name and access key
- VM private IP and NIC

---

## 🧪 Example: `dev.tfvars`

```hcl
environment          = "dev"
location             = "westeurope"
resource_group_name  = "defaultopella-rg"
vnet_name            = "defaultopella-vnet"
address_space        = ["10.0.0.0/16"]

public_subnets = [
  {
    name           = "web"
    address_prefix = "10.0.1.0/24"
    security_rules = {
      AllowHTTP = {
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
]

admin_username = "pablo"
admin_password = "YourSecurePassword123"
```

---

## 🧹 Best Practices

- Clean, modular and reusable code
- Clear separation of environments with externalized variables
- GitHub Actions pipeline based on branches
- Azure Storage Account used as Terraform remote backend
- Ready for `terraform-docs`, `tflint`, `pre-commit`, `checkov`, or `terratest` integration

---

📄 *This README was generated and refined with the help of AI.*