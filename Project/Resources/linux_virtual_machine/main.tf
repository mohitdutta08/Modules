

resource "azurerm_network_interface" "nicprjdevopslinux" {
  for_each = var.varlinuxvmprjdevops
  name = each.value.nicprjdevopsname
  location = each.value.rgprjdevopslocation
  resource_group_name = each.value.rgprjdevopsname

  ip_configuration {
    name = each.value.nicIPname
    subnet_id = data.azurerm_subnet.datasubnetprjdevopslinux[each.key].id
    private_ip_address_allocation = each.value.pvtIPaddalloc
  }
}

resource "azurerm_linux_virtual_machine" "vmprjdevlin1" {
  for_each = var.varlinuxvmprjdevops
  name = each.value.linuxmname
  resource_group_name = each.value.rgprjdevopsname
  location = each.value.rgprjdevopslocation
  size = each.value.linuxvmsize
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = each.value.disablepwdauth

  network_interface_ids = [azurerm_network_interface.nicprjdevopslinux[each.key].id]

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