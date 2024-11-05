# Enable Cloud Resource Manager API service used to create folders and projects.
resource "google_project_service" "gcp_resource_manager_api" {
  project = var.root-project-id
  service = "cloudresourcemanager.googleapis.com"
}
