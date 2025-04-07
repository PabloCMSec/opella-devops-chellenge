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

private_subnets = [
  {
    name           = "app"
    address_prefix = "10.0.2.0/24"
    security_rules = {
      AllowHTTP = {
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "10.0.1.0/24"
        destination_port_range     = "3000"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  },
  {
    name           = "db"
    address_prefix = "10.0.3.0/24"
    security_rules = {
      AllowHTTP = {
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "10.0.2.0/24"
        destination_port_range     = "5432"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
]

tags = {
  owner   = "pablo"
  project = "opella"
}
