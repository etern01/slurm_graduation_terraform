output "kube_cluster_id" {
  description = "Kubernetes cluster ID."
  value       = try(module.kube.cluster_id, null)
}

output "kube_cluster_name" {
  description = "Kubernetes cluster name."
  value       = try(module.kube.cluster_name, null)
}

output "external_cluster_cmd_str" {
  description = "Connection string to external Kubernetes cluster."
  value       = try(module.kube.external_cluster_cmd, null)
}

output "internal_cluster_cmd_str" {
  description = "Connection string to internal Kubernetes cluster."
  value       = try(module.kube.internal_cluster_cmd, null)
}


output "cluster_ca_certificate" {
  description = "Kubernetes cluster certificate."
  value       = try(module.kube.cluster_ca_certificate, null)
}


output "external_v4_address" {
  description = "Kubernetes cluster certificate."
  value       = try(module.kube.external_v4_address, null)
}