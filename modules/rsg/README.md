## 📦 Terraform Module: Azure Resource Group

This module creates an **Azure Resource Group** with customizable common tags. It is designed to integrate easily with multi-environment workspaces and automated pipelines.

---

### 🛠️ Resources Created

- `azurerm_resource_group`: Azure Resource Group

---

### 📥 Input Variables

| Name         | Description                        | Type          | Required |
|--------------|------------------------------------|---------------|----------|
| `name`       | Name of the resource group         | `string`      | ✅       |
| `location`   | Azure region                       | `string`      | ✅       |
| `environment`| Environment name (dev, prod…)      | `string`      | ✅       |
| `tags`       | Additional tags as a map           | `map(string)` | ❌ (default `{}`) |

---

### 📤 Outputs

| Name       | Description                            |
|------------|----------------------------------------|
| `id`       | ID of the resource group               |
| `name`     | Name of the resource group             |
| `location` | Region where the resource group resides|

---

### ▶️ Example Usage

```hcl
module "resource_group" {
  source      = "./modules/resource_group"

  name        = "example-rg"
  location    = "westeurope"
  environment = "dev"

  tags = {
    project = "my-project"
    owner   = "devops-team"
  }
}
```

---

📄 **This README has been automatically generated using an AI-assisted process.**
