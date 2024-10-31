provider "google" {
	project = var.project
}

# Enable Cloud Resource Manager API service used to create folders and projects.
resource "google_project_service" "gcp_resource_manager_api" {
  project = var.project
  service = "cloudresourcemanager.googleapis.com"
}

# Create root service account used to create project scopes.
# For scaffolding and to understand requirements.
# module "root-service-account" {
#	source = "./service-accounts"
# }

module "projects" {
	source = "./projects"
	service-account-key-file = var.service-account-key-file
	organization-id = var.organization-id
}
