resource "azurerm_virtual_network" "vnetprjdevops1" {
  for_each = var.varvnetprjdevops1
  name = each.value.vnetname
  resource_group_name = each.value.rgprjdevopsname
  location = each.value.rgprjdevopslocation
  address_space = each.value.address_space

dynamic "subnet" {
for_each = each.value.subnets
content {
  name = subnet.value.subnetname
  address_prefix = subnet.value.address_prefix
}
}

}