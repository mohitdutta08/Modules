resource "azurerm_resource_group" "rgprjdevops" {
  for_each = var.varrgprjdevops
  name = each.value.rgprjdevopsname
  location = each.value.rgprjdevopslocation
}

