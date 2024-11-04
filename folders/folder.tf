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
resource "google_folder" "test-project-folder" {
	display_name = "Test project folder"
	parent       = data.google_organization.grnet.name
	provider = google.project
	deletion_protection = false
}

# Export folder_id for use by root module
output "folder-id" {
	value = google_folder.test-project-folder.id
}

resource "google_folder" "test-project-jail-folder" {
	display_name = "Test project jail folder"
	parent       = data.google_organization.grnet.name
	provider = google.project
	deletion_protection = false
}
