data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster.name
  resource_group_name = var.resource_group_name
  location            = data.azurerm_resource_group.rg.location
  sku_tier            = var.aks_cluster.sku_tier
  dns_prefix          = var.aks_cluster.dns_prefix
  kubernetes_version  = var.aks_cluster.kubernetes_version
  network_profile {
    network_plugin    = "azure" #azure, kubet, none
    network_policy    = "azure" #calico, azure etc.,,
    load_balancer_sku = var.aks_cluster.load_balancer_sku 
  }

  default_node_pool {
    name           = var.aks_cluster.dnp_name
    node_count     = var.aks_cluster.dnp_node_count
    vm_size        = var.aks_cluster.dnp_vm_size
    vnet_subnet_id = var.aks_cluster.pod_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }
  tags = data.azurerm_resource_group.rg.tags
}











