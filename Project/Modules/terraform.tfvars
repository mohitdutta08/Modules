modvarrgprjdevops = {
  rgprjdevopsname1 = {
    rgprjdevopsname     = "rgprjdevops"
    rgprjdevopslocation = "East US"
  }
}

modvarsaprjdevops = {
  sa1 = {
    saprjdevops         = "sa1prjdevops"
    rgprjdevopsname     = "rgprjdevops"
    rgprjdevopslocation = "East US"
    saacctier           = "Standard"
    accreptype          = "LRS"

    network_ruless = {
      network_ruless1 = {
        default_action = "Deny"
      }
    }
  }
}

modvarvnetprjdevops1 = {
  vnet1 = {
    vnetname            = "vnetprjdevops1"
    rgprjdevopsname     = "rgprjdevops"
    rgprjdevopslocation = "East US"
    address_space       = ["10.0.0.0/16"]

    subnets = {
      subnet1 = {
        subnetname     = "subnetprjdevops1"
        address_prefix = "10.0.1.0/24"
      }

      subnet2 = {
        subnetname     = "subnetprjdevops2"
        address_prefix = "10.0.2.0/24"
      }

      subnet4 = {
        subnetname     = "AzureBastionSubnet"
        address_prefix = "10.0.3.0/24"
      }
    }
  }

  vnet2 = {
    vnetname            = "vnetprjdevops2"
    rgprjdevopsname     = "rgprjdevops"
    rgprjdevopslocation = "East US"
    address_space       = ["10.1.0.0/16"]

    subnets = {
      subnet3 = {
        subnetname     = "subnetprjdevops3"
        address_prefix = "10.1.3.0/24"
      }
    }
  }

  vnet3 = {
    vnetname            = "vnetprjdevops3"
    rgprjdevopsname     = "rgprjdevops"
    rgprjdevopslocation = "East US"
    address_space       = ["10.3.0.0/16"]

    subnets = {
      subnet4 = {
        subnetname     = "subnetprjdevops4"
        address_prefix = "10.1.4.0/24"
      }
    }
  }
}

modvarvmprjdevops = {
  winvm1 = {
    rgprjdevopsname     = "rgprjdevops"
    rgprjdevopslocation = "East US"

    subnetname = "subnetprjdevops1"
    vnetname   = "vnetprjdevops1"

    nicprjdevopsname = "nicvmprjdevwin1"
    nicIPname        = "nicIPvmprjdevwin1"
    pvtIPaddalloc    = "Dynamic"

    winvmname      = "vmprjdevwin1"
    winvmsize      = "Standard_B1ms"
    admin_username = "admin_user"
    admin_password = "Mohi2621510!"

    os_disks = {
      os_disk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }

    source_image_references = {
      src_img_ref1 = {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
      }
    }
  }

  winvm2 = {
    rgprjdevopsname     = "rgprjdevops"
    rgprjdevopslocation = "East US"

    subnetname = "subnetprjdevops3"
    vnetname   = "vnetprjdevops2"

    nicprjdevopsname = "nicvmprjdevwin2"
    nicIPname        = "nicIPvmprjdevwin2"
    pvtIPaddalloc    = "Dynamic"

    winvmname      = "vmprjdevwin2"
    winvmsize      = "Standard_B1ms"
    admin_username = "admin_user"
    admin_password = "Mohi2621510!"

    os_disks = {
      os_disk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }

    source_image_references = {
      src_img_ref1 = {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
      }
    }
  }
}

modvarlinuxvmprjdevops = {
  linuxvm1 = {
    subnetname = "subnetprjdevops2"
    vnetname   = "vnetprjdevops1"

    rgprjdevopsname     = "rgprjdevops"
    rgprjdevopslocation = "East US"

    nicprjdevopsname = "niclinuxprjdevops"
    nicIPname        = "nicLinuxIP"
    pvtIPaddalloc    = "Dynamic"

    linuxmname     = "vmprjdevlin1"
    linuxvmsize    = "Standard_B1ms"
    admin_username = "admin_user"
    admin_password = "Mohi2621510!"
    disablepwdauth = "false"

    os_disks = {
      os_disks1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }

    source_image_references = {
      source_image_references1 = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }
  }
}

modbastionprjdevops = {
  bastion1 = {
    subnetname          = "AzureBastionSubnet"
    vnetname="vnetprjdevops1"
    rgprjdevopsname     = "rgprjdevops"
    rgprjdevopslocation = "East US"
    allocation_method="Static"
sku="Standard"

bastionpipname="BastionPIP"

    bastionprjdevops   = "AzureBastionHostprjdevops"
    bastionIPname = "BastionIP1"


  }
}