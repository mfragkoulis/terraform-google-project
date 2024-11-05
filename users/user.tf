terraform {
	required_providers {
		google = {
			source  = "hashicorp/google"
    		}
  	}
}

resource "google_project_iam_binding" "project-owners" {
	project = var.project-id
	role    = "roles/owner"

	members = var.users-project-owner
}

resource "google_project_iam_binding" "project-editors" {
	project = var.project-id
	role    = "roles/editor"

	members = var.users-project-editor
}
