data "azurerm_subnet" "name" {
    for_each = var.bastionprjdevops
    name = each.value.subnetname
    resource_group_name = each.value.rgprjdevopsname
    virtual_network_name = each.value.vnetname
  }