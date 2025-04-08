## 🖥️ Terraform Module: Ubuntu Virtual Machine on Azure

This module provisions a **Linux Virtual Machine (Ubuntu 24.04 LTS)** in Azure, along with a **Network Interface (NIC)** and essential configuration options. It is designed for simplicity and reusability across environments.

---

### 🛠️ Resources Created

- `azurerm_linux_virtual_machine`
- `azurerm_network_interface`

---

### 📥 Input Variables

| Name                 | Description                         | Type        | Default             | Required |
|----------------------|-------------------------------------|-------------|---------------------|----------|
| `name`              | Name of the VM                      | `string`    | —                   | ✅       |
| `location`          | Azure region                        | `string`    | —                   | ✅       |
| `resource_group_name`| Name of the resource group          | `string`    | —                   | ✅       |
| `size`              | VM size (SKU)                       | `string`    | `"Standard_DS1_v2"` | ❌       |
| `admin_username`    | Admin username for SSH access       | `string`    | —                   | ✅       |
| `admin_password`    | Admin password for login            | `string`    | —                   | ✅       |
| `environment`       | Environment name                    | `string`    | —                   | ✅       |
| `tags`              | Additional resource tags            | `map(string)` | `{}`              | ❌       |

---

### 📤 Outputs

| Name            | Description                          |
|-----------------|--------------------------------------|
| `id`            | VM resource ID                       |
| `name`          | Name of the VM                       |
| `private_ip`    | Private IP of the VM                 |
| `admin_username`| Admin username                       |

---

### ▶️ Usage Example

```hcl
module "ubuntu_vm" {
  source              = "./modules/ubuntu-vm"
  name                = "dev-vm"
  location            = "westeurope"
  resource_group_name = "dev-rg"
  admin_username      = "ubuntuadmin"
  admin_password      = "P@ssw0rd123!"
  environment         = "dev"

  tags = {
    project = "dev-environment"
    owner   = "team-devops"
  }
}
```

---

📄 **This README has been automatically generated using an AI-assisted process.**
