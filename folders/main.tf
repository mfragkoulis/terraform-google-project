# This is the ID of the Grnet organization used for testing.
# Instead, it should be the id of the institution's organization passed as input to Terraform.
data "google_organization" "grnet" {
	organization = var.organization-id
}

# The role roles/resourcemanager.folderCreator should be granted at the organization level.
# https://cloud.google.com/resource-manager/docs/creating-managing-folders
resource "google_folder" "project-folder" {
	display_name = var.project-folder-name
	# Required form: folders/<id> or organizations/<id>
	parent = data.google_organization.grnet.name
	# For testing
	deletion_protection = false
}

resource "google_folder" "project-jail-folder" {
	display_name = var.project-jail-folder-name
	parent = data.google_organization.grnet.name
	# For testing
	deletion_protection = false
}
