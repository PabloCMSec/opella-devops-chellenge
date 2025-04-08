vnet_name           = "opella"
resource_group_name = "opella-rg"
location            = "westeurope"
address_space       = ["10.1.0.0/16"]

public_subnets = {
  web = {
    address_prefix = "10.1.1.0/24"
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
  app = {
    address_prefix = "10.1.2.0/24"
    security_rules = {
      AllowHTTP = {
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "10.1.1.0/24"
        destination_port_range     = "3000"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  },
  db = {
    address_prefix = "10.1.3.0/24"
    security_rules = {
      AllowHTTP = {
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "10.1.2.0/24"
        destination_port_range     = "5432"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

vm_size           = "Standard_DS1_v2"
vm_admin_username = "adminuser"
vm_admin_password = "P@ssw0rd1234!"
vm_subnet_key     = "app"


tags = {
  owner   = "pablo"
  project = "opella"
}
