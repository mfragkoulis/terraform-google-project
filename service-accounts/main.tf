# The following doesn't work because the credentials field in the Terraform
# google provider expects the JSON key of a service account
# to have specific fields, which is the case when a service
# account key is created and downloaded from the Google Cloud console.
# When a key is created and downloaded programmatically in Terraform
# a different JSON structure is used with different fields
# and that structure raises an error.
# The corresponding issue is documented here.
# https://github.com/hashicorp/terraform-provider-google/issues/6497

resource "google_service_account" "root_sa" {
  account_id   = "root_sa"
  display_name = "Service Account used to create project scopes."
  project      = var.root_project_id
}

resource "google_service_account_key" "root_sa_key" {
  service_account_id = google_service_account.root_sa.name
  depends_on         = [google_service_account.root_sa]
}
