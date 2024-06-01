

resource "azurerm_network_interface" "nicprjdevops" {
  for_each = var.varvmprjdevops
  name = each.value.nicprjdevopsname
  location = each.value.rgprjdevopslocation
  resource_group_name = each.value.rgprjdevopsname

  ip_configuration {
    name = each.value.nicIPname
    subnet_id = data.azurerm_subnet.datasubnetprjdevops[each.key].id
    private_ip_address_allocation = each.value.pvtIPaddalloc
  }
}

resource "azurerm_windows_virtual_machine" "name" {
  for_each = var.varvmprjdevops
  name = each.value.winvmname
  resource_group_name = each.value.rgprjdevopsname
  location = each.value.rgprjdevopslocation
  size = each.value.winvmsize
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password

  network_interface_ids = [azurerm_network_interface.nicprjdevops[each.key].id]

dynamic "os_disk" {
    for_each = each.value.os_disks
    content {
      caching = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }
  }

dynamic "source_image_reference" {
  for_each = each.value.source_image_references
  content {
    publisher = source_image_reference.value.publisher
    offer = source_image_reference.value.offer
    sku = source_image_reference.value.sku
    version = source_image_reference.value.version
  }
}

}

