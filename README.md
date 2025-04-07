# opella-devops-chellenge
## ☁️ Terraform Project: Azure Infrastructure Foundation

This Terraform project sets up a basic but scalable infrastructure in **Microsoft Azure**, suitable for multiple environments (`dev`, `prod`). It includes:

- A **Resource Group**.
- A **Virtual Network** with public and private subnets.
- A **Storage Account**.
- Environment isolation using `terraform.workspace`.

---

### 📁 Project Structure

```bash
.
├── arch.tf             # Main architecture composition (modules)
├── locals.tf           # Environment settings
├── outputs.tf          # Exported values
├── variables.tf        # Input variables
├── dev.tfvars          # Dev environment variables
├── prod.tfvars         # Prod environment variables
├── versions.tf         # Providers and Terraform version
```

---

### 📦 Modules Used

- `../modules/rsg` → Azure Resource Group
- `../modules/vnet` → Virtual Network with public/private subnets
- `../modules/sta` → Storage Account

Each module accepts common tags and is dynamically named using the workspace (e.g., `dev-rg`, `prod-vnet`, etc.).

---

### ▶️ How to Use

Initialize and apply a specific environment:

```bash
terraform init
terraform workspace new dev   # or 'prod'
terraform apply -var-file=dev.tfvars
```

---

### 📤 Outputs

This project exports:

- Resource Group name, ID, and location
- VNet name, ID, address space
- Subnet IDs
- NSG IDs
- Storage Account name, access key, blob endpoint

---

### 🧪 Example: dev.tfvars

```hcl
vnet_name           = "opella"
resource_group_name = "opella-rg"
location            = "westeurope"
address_space       = ["10.0.0.0/16"]

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
```

---

📄 **This README has been automatically generated using an AI-assisted process.**
