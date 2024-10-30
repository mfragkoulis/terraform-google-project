provider "google" {
	alias = "project"
	project = "grnet-tf-sandbox"
	credentials = jsondecode(base64decode(var.service-account-private-key))
}

# This is the ID of the Grnet organization used for testing.
# Instead, it should be the id of the institution's organization passed as input to Terraform.
data "google_organization" "grnet" {
	organization = "987298873606"
}

resource "google_folder" "project-scope" {
	display_name = "Project folder"
	parent       = data.google_organization.grnet.name
	provider = google.project
}

resource "google_project" "project" {
	name       = "Test Project"
	project_id = "project-id"
	# Set sandbox's billing account for testing
	#billing_account = google.project.project.billing_account
	folder_id  = google_folder.project-scope.name
	provider = google.project
}
