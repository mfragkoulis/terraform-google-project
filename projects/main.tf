# The role roles/resourcemanager.projectCreator should be granted at the organization or folder level.
# Respectively, roles/resourceManager.projectDeleter would allow to delete a project.
# Respectively, roles/resourceManager.projectMover would allow to move a project.
# https://cloud.google.com/resource-manager/docs/access-control-proj
resource "google_project" "project" {
  name       = var.project_name
  project_id = var.project_id
  # No billing account available for testing.
  # billing_account = var.billing_account_id
  folder_id = var.folder_id
  # For testing
  deletion_policy = "DELETE"
}
