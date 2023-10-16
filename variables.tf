variable "project_id" {
  type        = string
  description = "Project ID"
}

variable "region" {
  type        = string
  description = "Default region"
  default     = "us-east1"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name"
}

variable "cluster_location" {
  type        = string
  description = "Region or zone location of cluster master"
  default     = "us-east1-b"
}

variable "initial_node_count" {
  type        = number
  description = "Initial node count"
  default     = 1
}

variable "remove_default_node_pool" {
  type        = bool
  description = "Delete the default node pool upon cluster creation"
  default     = true
}

variable "network_policy_enabled" {
  type        = bool
  description = "Enables network policy"
  default     = true
}

variable "nodepool_name" {
  type        = string
  description = "Nodepool name"
}

variable "nodepool_location" {
  type        = string
  description = "Region of nodepool location"
  default     = "us-east1-b"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the cluster"
  default     = 1
}

variable "preemptible" {
  type        = bool
  description = "Enables preemptible instance types for nodepool"
  default     = true
}

variable "machine_type" {
  type        = string
  description = "Instance type for node pool"
  default     = "e2-small"
}

variable "deletion_protection" {
  type        = bool
  description = "Cluster deletion protection"
  default     = false
}

variable "iam_roles" {
  type        = list(string)
  description = "List of IAM roles to assign to service account"
  default = [
    "roles/container.nodeServiceAccount"
  ]
}

variable "workload_metadata_enabled" {
  type        = bool
  description = "Enables workload metadata at the node level"
  default     = true
}

variable "auto_upgrade" {
  type        = bool
  description = "Enables auto upgrade of Kubernetes on nodes"
  default     = true
}

variable "auto_repair" {
  type        = bool
  description = "Enable auto repair of nodes failing health checks"
  default     = true
}

variable "kubeconfig_download" {
  type        = bool
  description = "Autodownload kubeconfig (overwrites existing file in ~/.kube/config)"
  default     = true
}
