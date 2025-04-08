## 📦 Terraform Module: Azure Virtual Network with Subnets and NSGs

This module provisions an **Azure Virtual Network (VNet)** along with configurable **public and private subnets**, and **Network Security Groups (NSGs)** with optional security rules. The module uses `map(object)` for subnet definitions, allowing better resource tracking and naming.

---

### 🛠️ Resources Created

- `azurerm_virtual_network`: Virtual Network
- `azurerm_subnet`: Public and Private Subnets
- `azurerm_network_security_group`: NSGs per subnet (optional)
- `azurerm_network_security_rule`: Security rules per subnet (optional)

---

### 📥 Input Variables

| Name                 | Description                                  | Type            | Required |
|----------------------|----------------------------------------------|------------------|----------|
| `name`              | Name of the Virtual Network                  | `string`         | ✅       |
| `location`          | Azure region                                 | `string`         | ✅       |
| `environment`       | Environment name                             | `string`         | ✅       |
| `resource_group_name`| Name of the resource group                   | `string`         | ✅       |
| `address_space`     | List of CIDR blocks for the VNet             | `list(string)`   | ✅       |
| `public_subnets`    | Map of public subnets keyed by subnet name   | `map(object)`    | ✅       |
| `private_subnets`   | Map of private subnets keyed by subnet name  | `map(object)`    | ✅       |
| `tags`              | Additional tags                              | `map(string)`    | ❌ (default `{}`) |

Each subnet object supports:

```hcl
{
  address_prefix = "10.0.x.0/24"
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
```

---

### 📤 Outputs

| Name                 | Description                                |
|----------------------|--------------------------------------------|
| `vnet_id`           | ID of the VNet                             |
| `vnet_name`         | Name of the VNet                           |
| `vnet_address_space`| CIDR block(s) of the VNet                  |
| `public_subnet_ids` | Map of public subnet names to their IDs    |
| `private_subnet_ids`| Map of private subnet names to their IDs   |
| `public_nsg_ids`    | Map of public NSG names to their IDs       |
| `private_nsg_ids`   | Map of private NSG names to their IDs      |

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

  public_subnets = {
    web = {
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
  }

  private_subnets = {
    db = {
      address_prefix = "10.0.2.0/24"
    }
  }

  tags = {
    project = "my-project"
    owner   = "devops-team"
  }
}
```

---

📄 **This README has been automatically generated using an AI-assisted process.**
