# The role roles/resourcemanager.projectCreator should be granted at the organization or folder level.
# https://cloud.google.com/resource-manager/docs/access-control-proj
resource "google_project" "project" {
	name       = var.project-name
	project_id = var.project-id
	# No billing account available for testing.
	# billing_account = var.billing-account-id
	folder_id  = var.folder-id
	# For testing
	deletion_policy = "DELETE"
}

# Export project_id for use by root module.
# Could use var.project-id and omit this, but prefer to mark dependency explicitly.
output "project-id" {
	value = google_project.project.project_id
}
