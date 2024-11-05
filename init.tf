provider "google" {
	project = var.root-project-id
	credentials = var.service-account-key-file
}

provider "google" {
	# Use same provider with different configuration (project).
	alias = "project"
	project = module.projects.project-id
	credentials = var.service-account-key-file
}

module "services" {
	source = "./services"
	root-project-id = var.root-project-id
}

module "folders" {
	source = "./folders"
	organization-id = var.organization-id
	project-folder-name = var.project-folder-name
	project-jail-folder-name = var.project-jail-folder-name

	depends_on = [
		module.services
	]
}

module "projects" {
	source = "./projects"
	project-id = var.project-id
	project-name = var.project-name
	folder-id = module.folders.folder-id
	billing-account-id = var.billing-account-id

	depends_on = [
		module.services
	]
}

module "users" {
	source = "./users"
	providers = {
		google = google.project
	}
	project-id = module.projects.project-id
	users-project-owner = var.users-project-owner
	users-project-editor = var.users-project-editor

	depends_on = [
		module.services
	]
}
