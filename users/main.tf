resource "google_project_iam_binding" "project_owners" {
  project = var.project_id
  role    = "roles/owner"

  members = var.users_project_owner
}

resource "google_project_iam_binding" "project_editors" {
  project = var.project_id
  role    = "roles/editor"

  members = var.users_project_editor
}
