provider "google" {
  project = var.project_id
  region  = var.region
}

# Enable Kubernetes Engine in Google Cloud
resource "null_resource" "enable_kubernetes_engine" {
  provisioner "local-exec" {
    command = "gcloud services enable --async container.googleapis.com --project ${var.project_id}"
  }
}

# Ignoring tfsec rule below because pod-security-policy has been deprecated
# https://cloud.google.com/kubernetes-engine/docs/deprecations/podsecuritypolicy
resource "google_container_cluster" "primary" { #tfsec:ignore:google-gke-enforce-pod-security-policy
  name     = var.cluster_name
  location = var.cluster_location

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count
  deletion_protection      = var.deletion_protection

  network_policy {
    enabled = var.network_policy_enabled
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = var.allowed_cidr_block
      display_name = "allowed-cidr"
    }
  }

}

resource "google_container_node_pool" "primary_nodes" {
  name       = var.nodepool_name
  location   = var.nodepool_location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count
  management {
    auto_upgrade = var.auto_upgrade
    auto_repair  = var.auto_repair
  }

  node_config {
    preemptible  = var.preemptible
    machine_type = var.machine_type

    metadata = {
      disable-legacy-endpoints = true
    }

    workload_metadata_config {
      mode = var.workload_metadata_enabled ? "GKE_METADATA" : "GCE_METADATA"
    }

    service_account = google_service_account.gke_sa.email
    oauth_scopes    = var.oauth_scopes
  }
}

# Enable auth plugin and download kubeconfig; overwrites file located at ~/.kube/config
resource "null_resource" "kubeconfig" {
  count = var.kubeconfig_download ? 1 : 0
  depends_on = [
    google_container_cluster.primary, google_container_node_pool.primary_nodes
  ]
  provisioner "local-exec" {
    command = "gcloud components install gke-gcloud-auth-plugin"
  }
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${var.cluster_location} --project ${var.project_id}"
  }
}
