data "azurerm_subnet" "datasubnetprjdevopslinux" {
  for_each = var.varlinuxvmprjdevops
  name = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name = each.value.rgprjdevopsname
}