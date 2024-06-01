module "modrgprjdevops" {
  source         = "../Resources/resource_group"
  varrgprjdevops = var.modvarrgprjdevops
}

module "modsaprjdevops" {
  depends_on     = [module.modrgprjdevops]
  source         = "../Resources/storage_account"
  varsaprjdevops = var.modvarsaprjdevops
}

module "modvnetprjdevops" {
  depends_on        = [module.modrgprjdevops]
  source            = "../Resources/virtual_network"
  varvnetprjdevops1 = var.modvarvnetprjdevops1
}

module "modvmprjdevwin1" {
  depends_on     = [module.modvnetprjdevops]
  source         = "../Resources/windows_virtual_machine"
  varvmprjdevops = var.modvarvmprjdevops
}

module "modvmprjdevopslinux" {
  depends_on          = [module.modvnetprjdevops]
  source              = "../Resources/linux_virtual_machine"
  varlinuxvmprjdevops = var.modvarlinuxvmprjdevops
}

module "modbastionprjdevops" {
  depends_on       = [module.modvnetprjdevops]
  source           = "../Resources/bastion_host"
  bastionprjdevops = var.modbastionprjdevops
}