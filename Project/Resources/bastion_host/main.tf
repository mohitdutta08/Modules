resource "azurerm_public_ip" "pipbastionhost" {
    for_each = var.bastionprjdevops
  name = each.value.bastionpipname
  resource_group_name = each.value.rgprjdevopsname
  location = each.value.rgprjdevopslocation
allocation_method = each.value.allocation_method
sku = each.value.sku
  }  

  resource "azurerm_bastion_host" "bastionprjdevops" {
    for_each = var.bastionprjdevops
    name = each.value.bastionprjdevops
    resource_group_name = each.value.rgprjdevopsname
  location = each.value.rgprjdevopslocation 

ip_configuration {
  name = each.value.bastionIPname
  subnet_id = data.azurerm_subnet.name[each.key].id
  public_ip_address_id = azurerm_public_ip.pipbastionhost[each.key].id
}
  }

  