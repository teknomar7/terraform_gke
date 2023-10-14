provider "google" {
  project = var.project
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.cluster_location

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.nodepool_name
  location   = var.nodepool_location
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = var.preemptible
    machine_type = var.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    # service_account = google_service_account.default.email
    # oauth_scopes = [
    #   "https://www.googleapis.com/auth/cloud-platform"
    # ]
  }
}
