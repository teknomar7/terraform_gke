resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = "${var.cluster_name}-vpc"
  auto_create_subnetworks = var.auto_create_subnetworks
}

