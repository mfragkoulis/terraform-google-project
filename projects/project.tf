provider "google" {
	# Use same provider with different configuration (credentials).
	alias = "project"
	project = "grnet-tf-sandbox"
	credentials = var.service-account-key-file
}

# The role roles/resourcemanager.projectCreator should be granted at the organization or folder level.
# https://cloud.google.com/resource-manager/docs/access-control-proj
resource "google_project" "test-project" {
	name       = "Test Project"
	project_id = "test-project-id-${formatdate("YYYYMMDDhhmmss", timestamp())}"
	# Set sandbox's billing account for testing
	#billing_account = google.project.project.billing_account
	folder_id  = var.folder-id
	provider = google.project
	deletion_policy = "DELETE"
}
