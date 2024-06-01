resource "azurerm_storage_account" "saprjdevops" {
    for_each = var.varsaprjdevops
  name = each.value.saprjdevops
  resource_group_name = each.value.rgprjdevopsname
  location = each.value.rgprjdevopslocation
  account_tier = each.value.saacctier
  account_replication_type = each.value.accreptype

 dynamic "network_rules" {
    for_each = each.value.network_ruless
    content {
    default_action = network_rules.value.default_action
  }
}
}

