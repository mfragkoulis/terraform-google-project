# Enable Cloud Resource Manager API service used to create folders and projects.
# The role roles/serviceusage.serviceUsageAdmin should be granted at the organization level.
resource "google_project_service" "gcp_resource_manager_api" {
  project = var.root-project-id
  service = "cloudresourcemanager.googleapis.com"
}
