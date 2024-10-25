resource_group_name = "test-rg-02-pipe"


aks_cluster = {
  name               = "aks-aceo-29"
  sku_tier           = "Free"
  dns_prefix         = "aks-aceo-29"
  kubernetes_version = "1.30.0"
  pod_subnet_id      = "/subscriptions/0f406152-f66c-48ab-8849-899264452993/resourceGroups/test-rg-02-pipe/providers/Microsoft.Network/virtualNetworks/test-rg-vnet-01/subnets/test-vnet-01-sub2"
}