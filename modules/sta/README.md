## 📦 Terraform Module: Azure Storage Account

This module provisions an **Azure Storage Account** with customizable configuration for performance tier, replication, and common tags. It is designed to fit within automated and multi-environment deployments.

---

### 🛠️ Resources Created

- `azurerm_storage_account`: Azure Storage Account

---

### 📥 Input Variables

| Name                      | Description                                 | Type         | Required |
|---------------------------|---------------------------------------------|--------------|----------|
| `name`                   | Name of the storage account                 | `string`     | ✅       |
| `location`               | Azure region                                | `string`     | ✅       |
| `resource_group_name`    | Name of the resource group                  | `string`     | ✅       |
| `account_tier`           | Storage account tier (`Standard`/`Premium`) | `string`     | ❌ (default: `Standard`) |
| `account_replication_type` | Replication type (`LRS`, `GRS`, etc.)       | `string`     | ❌ (default: `LRS`) |
| `environment`            | Environment name (e.g., dev, prod)          | `string`     | ✅       |
| `tags`                   | Additional tags as a map                    | `map(string)`| ❌ (default `{}`) |

---

### 📤 Outputs

| Name                            | Description                              |
|---------------------------------|------------------------------------------|
| `storage_account_name`          | Name of the storage account              |
| `storage_account_primary_access_key` | Primary access key of the storage account |
| `storage_account_primary_blob_endpoint` | Primary blob endpoint URL             |

---

### ▶️ Usage Example

```hcl
module "storage_account" {
  source                  = "./modules/storage_account"

  name                    = "mystorageacct"
  location                = "westeurope"
  resource_group_name     = "example-rg"
  environment             = "prod"

  account_tier            = "Standard"
  account_replication_type = "LRS"

  tags = {
    project = "my-project"
    owner   = "devops-team"
  }
}
```

---

📄 **This README has been automatically generated using an AI-assisted process.**
