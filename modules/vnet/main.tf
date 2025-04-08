resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags = merge(
    {
      "Name"        = var.name
      "Environment" = var.environment
    },
    var.tags,
  )
}

resource "azurerm_subnet" "public" {
  for_each = var.public_subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [each.value.address_prefix]
}

resource "azurerm_subnet" "private" {
  for_each = var.private_subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [each.value.address_prefix]
}

resource "azurerm_network_security_group" "public_nsg" {
  for_each = {
    for key, subnet in var.public_subnets :
    key => subnet if length(try(subnet.security_rules, {})) > 0
  }

  name                = "${each.key}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = merge(
    {
      "Name"        = "${each.key}-nsg"
      "Environment" = var.environment
    },
    var.tags,
  )
}

resource "azurerm_network_security_group" "private_nsg" {
  for_each = {
    for key, subnet in var.private_subnets :
    key => subnet if length(try(subnet.security_rules, {})) > 0
  }

  name                = "${each.key}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = merge(
    {
      "Name"        = "${each.key}-nsg"
      "Environment" = var.environment
    },
    var.tags,
  )
}

resource "azurerm_network_security_rule" "public_rules" {
  for_each = {
    for rule in flatten([
      for key, subnet in var.public_subnets : [
        for rule_name, rule in try(subnet.security_rules, {}) : {
          id         = "${key}-${rule_name}"
          subnet_key = key
          rule_name  = rule_name
          rule       = rule
        }
      ]
    ]) : rule.id => rule
  }

  name                        = each.value.rule_name
  priority                    = each.value.rule.priority
  direction                   = each.value.rule.direction
  access                      = each.value.rule.access
  protocol                    = each.value.rule.protocol
  source_port_range           = each.value.rule.source_port_range
  destination_port_range      = each.value.rule.destination_port_range
  source_address_prefix       = each.value.rule.source_address_prefix
  destination_address_prefix  = each.value.rule.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.public_nsg[each.value.subnet_key].name
}

resource "azurerm_network_security_rule" "private_rules" {
  for_each = {
    for rule in flatten([
      for key, subnet in var.private_subnets : [
        for rule_name, rule in try(subnet.security_rules, {}) : {
          id         = "${key}-${rule_name}"
          subnet_key = key
          rule_name  = rule_name
          rule       = rule
        }
      ]
    ]) : rule.id => rule
  }

  name                        = each.value.rule_name
  priority                    = each.value.rule.priority
  direction                   = each.value.rule.direction
  access                      = each.value.rule.access
  protocol                    = each.value.rule.protocol
  source_port_range           = each.value.rule.source_port_range
  destination_port_range      = each.value.rule.destination_port_range
  source_address_prefix       = each.value.rule.source_address_prefix
  destination_address_prefix  = each.value.rule.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.private_nsg[each.value.subnet_key].name
}

resource "azurerm_subnet_network_security_group_association" "public" {
  for_each = azurerm_network_security_group.public_nsg

  subnet_id                 = azurerm_subnet.public[each.key].id
  network_security_group_id = each.value.id
}

resource "azurerm_subnet_network_security_group_association" "private" {
  for_each = azurerm_network_security_group.private_nsg

  subnet_id                 = azurerm_subnet.private[each.key].id
  network_security_group_id = each.value.id
}
