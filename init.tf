provider "google" {
	project = var.project
}

# Enable Cloud Resource Manager API service used to create folders and projects.
resource "google_project_service" "gcp_resource_manager_api" {
  project = var.project
  service = "cloudresourcemanager.googleapis.com"
}

# Enable Cloud Billing API service used to manage billing accounts.
resource "google_project_service" "gcp_billing_api" {
  project = var.project
  service = "cloudbilling.googleapis.com"
}

# Create root service account used to create project scopes.
# Create root service account used to create project scopes.
# For scaffolding and to understand requirements.
# module "root-service-account" {
#	source = "./service-accounts"
# }

module "folders" {
	source = "./folders"
	service-account-key-file = var.service-account-key-file
	organization-id = var.organization-id
}

module "projects" {
	source = "./projects"
	service-account-key-file = var.service-account-key-file
	organization-id = var.organization-id
	folder-id = module.folders.folder-id
}
