# TODO: refactor such that parent_id works with folder as well.
data "google_organization" "grnet" {
  organization = var.parent_id
}

# The role roles/resourcemanager.folderCreator should be granted at the organization level.
# https://cloud.google.com/resource-manager/docs/creating-managing-folders
resource "google_folder" "project_folder" {
  display_name = var.project_folder_name
  # Required form: folders/<id> or organizations/<id>
  parent = data.google_organization.grnet.name
  # For testing
  deletion_protection = false
}

resource "google_folder" "project_jail_folder" {
  display_name = var.project_jail_folder_name
  parent       = data.google_organization.grnet.name
  # For testing
  deletion_protection = false
}
