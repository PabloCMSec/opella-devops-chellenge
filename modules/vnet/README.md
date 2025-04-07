## 📦 Terraform Module: Azure Virtual Network with Subnets and NSGs

This module provisions an **Azure Virtual Network (VNet)** along with configurable **public and private subnets**, and **Network Security Groups (NSGs)** with optional security rules. It is suitable for modular, multi-environment infrastructure deployments.

---

### 🛠️ Resources Created

- `azurerm_virtual_network`: Virtual Network
- `azurerm_subnet`: Public and Private Subnets
- `azurerm_network_security_group`: NSGs for each subnet type (optional)

---

### 📥 Input Variables

| Name                | Description                                 | Type                    | Required |
|---------------------|---------------------------------------------|-------------------------|----------|
| `name`             | Name of the Virtual Network                 | `string`                | ✅       |
| `location`         | Azure region                                | `string`                | ✅       |
| `environment`      | Environment name                            | `string`                | ✅       |
| `resource_group_name` | Azure Resource Group name                  | `string`                | ✅       |
| `address_space`    | List of CIDR blocks for the VNet            | `list(string)`          | ✅       |
| `public_subnets`   | List of public subnet objects               | `list(object)`          | ✅       |
| `private_subnets`  | List of private subnet objects              | `list(object)`          | ✅       |
| `tags`             | Common tags for all resources               | `map(string)`           | ❌ (default `{}`) |

Each subnet object supports:
- `name`: Subnet name
- `address_prefix`: CIDR
- `security_rules`: (optional) Map of NSG rules with:
  - `priority`, `direction`, `access`, `protocol`
  - `source_port_range`, `destination_port_range`
  - `source_address_prefix`, `destination_address_prefix`

---

### 📤 Outputs

| Name                 | Description                              |
|----------------------|------------------------------------------|
| `vnet_id`           | ID of the VNet                           |
| `vnet_name`         | Name of the VNet                         |
| `vnet_address_space`| Address space of the VNet                |
| `public_subnet_ids` | IDs of public subnets                    |
| `private_subnet_ids`| IDs of private subnets                   |
| `public_nsg_ids`    | IDs of public NSGs                       |
| `private_nsg_ids`   | IDs of private NSGs                      |

---

### ▶️ Usage Example

```hcl
module "vnet" {
  source              = "./modules/virtual_network"
  name                = "vnet-dev"
  location            = "westeurope"
  environment         = "dev"
  resource_group_name = "rg-dev"
  address_space       = ["10.0.0.0/16"]

  public_subnets = [
    {
      name           = "public-subnet-1"
      address_prefix = "10.0.1.0/24"
    }
  ]

  private_subnets = [
    {
      name           = "private-subnet-1"
      address_prefix = "10.0.2.0/24"
    }
  ]

  tags = {
    project = "my-project"
    owner   = "devops-team"
  }
}
```

---

📄 **This README has been automatically generated using an AI-assisted process.**
