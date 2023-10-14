variable "project" {
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
  default     = "us-east1-a"
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

variable "nodepool_name" {
  type        = string
  description = "Nodepool name"
}

variable "nodepool_location" {
  type        = string
  description = "Region of nodepool location"
  default = "us-east1"
}

variable "preemptible" {
  type        = bool
  description = "Use preemptible instance types for nodepool"
  default     = true
}

variable "machine_type" {
  type        = string
  description = "Instance type for node pool"
  default = "e2-medium"
}
