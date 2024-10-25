output "aks_resource_id" {
  description = "Resource Id of AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}
