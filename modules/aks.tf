provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks" {
  name     = "${var.rg_name}-k8s-resources"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                            = "${var.rg_name}-k8s"
  location                        = azurerm_resource_group.aks.location
  resource_group_name             = azurerm_resource_group.aks.name
  dns_prefix                      = "${var.rg_name}-k8s01"
  #api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges


  default_node_pool {
    name       = "k8snodepool"
    os_disk_size_gb = 30
    node_count = var.node_count
    vm_size    = var.node_size
  }

  tags = {
    tag_env = var.tag_env
  }

  network_profile {
    network_plugin    = var.plugin
    load_balancer_sku = var.lb_sku
  }

#Should be service_principal in production
  identity {
    type = "SystemAssigned"
  }

  linux_profile {
    admin_username = var.admin_user
    ssh_key {
      key_data = "${file("~/.ssh/id_rsa.pub")}"
    }
}

  #private_cluster_enabled = true


  addon_profile {
    aci_connector_linux {
      enabled = false
    }

    azure_policy {
      enabled = false
    }

    http_application_routing {
      enabled = false
    }

    kube_dashboard {
      enabled = false
    }

    oms_agent {
      enabled = false
    }
  }
}

