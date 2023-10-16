output "id" {
  value       = google_container_cluster.primary.id
  description = "Cluster identifier"
}

output "self_link" {
  value       = google_container_cluster.primary.self_link
  description = "Server-defined URL for the resource"
}

output "endpoint" {
  value       = google_container_cluster.primary.endpoint
  description = "IP of the cluster master"
}

output "master_version" {
  value       = google_container_cluster.primary.master_version
  description = "Current Kubernetes version of the master"
}
