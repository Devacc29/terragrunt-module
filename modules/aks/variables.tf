variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the Kubernetes Cluster."
}

variable "aks_cluster" {
  type = object({
    name               = string
    sku_tier           = string
    dns_prefix         = string
    kubernetes_version = string
    pod_subnet_id      = string
    load_balancer_sku  = string
    dnp_vm_size = string
    dnp_node_count = number
    dnp_name = string
  })
}



