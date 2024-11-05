provider "google" {
  project     = var.root_project_id
  credentials = var.service_account_key_file
}

provider "google" {
  # Use same provider with different configuration (project).
  alias       = "project"
  project     = module.projects.project_id
  credentials = var.service_account_key_file
}

module "services" {
  source          = "./services"
  root-project-id = var.root_project_id
}

module "folders" {
  source                   = "./folders"
  organization-id          = var.organization_id
  project-folder-name      = var.project_folder_name
  project-jail-folder-name = var.project_jail_folder_name

  depends_on = [
    module.services
  ]
}

module "projects" {
  source             = "./projects"
  project-id         = var.project_id
  project-name       = var.project_name
  folder-id          = module.folders.folder_id
  billing-account-id = var.billing_account_id

  depends_on = [
    module.services
  ]
}

module "users" {
  source = "./users"
  providers = {
    google = google.project
  }
  project-id           = module.projects.project_id
  users-project-owner  = var.users_project_owner
  users-project-editor = var.users_project_editor

  depends_on = [
    module.services
  ]
}
