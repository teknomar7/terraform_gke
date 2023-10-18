# Create IAM service account and attach roles

resource "google_service_account" "gke_sa" {
  account_id   = "${var.cluster_name}-gke-sa"
  display_name = "Custom GKE service account"
}

resource "google_project_iam_member" "project" {
  count   = length(var.iam_roles)
  project = var.project_id
  role    = var.iam_roles[count.index]
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}
