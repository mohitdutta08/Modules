data "azurerm_subnet" "datasubnetprjdevops" {
  for_each = var.varvmprjdevops
  name = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name = each.value.rgprjdevopsname
}