provider "google" {
	# Use same provider with different configuration (credentials).
	alias = "project"
	project = "grnet-tf-sandbox"
	credentials = var.service-account-key-file
}

# This is the ID of the Grnet organization used for testing.
# Instead, it should be the id of the institution's organization passed as input to Terraform.
data "google_organization" "grnet" {
	organization = var.organization-id
}

# The role roles/resourcemanager.folderCreator should be granted at the organization level.
# https://cloud.google.com/resource-manager/docs/creating-managing-folders
resource "google_folder" "project-scope" {
	display_name = "Project folder"
	parent       = data.google_organization.grnet.name
	provider = google.project
}

# The role roles/resourcemanager.projectCreator should be granted at the organization or folder level.
# https://cloud.google.com/resource-manager/docs/access-control-proj
resource "google_project" "project" {
	name       = "Test Project"
	project_id = "project-id"
	# Set sandbox's billing account for testing
	#billing_account = google.project.project.billing_account
	folder_id  = google_folder.project-scope.name
	provider = google.project
}
