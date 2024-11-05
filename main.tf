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
  root_project_id = var.root_project_id
}

module "folders" {
  source                   = "./folders"
  organization_id          = var.organization_id
  project_folder_name      = var.project_folder_name
  project_jail_folder_name = var.project_jail_folder_name

  depends_on = [
    module.services
  ]
}

module "projects" {
  source             = "./projects"
  project_id         = var.project_id
  project_name       = var.project_name
  folder_id          = module.folders.folder_id
  billing_account_id = var.billing_account_id

  depends_on = [
    module.services
  ]
}

module "users" {
  source = "./users"
  providers = {
    google = google.project
  }
  project_id           = module.projects.project_id
  users_project_owner  = var.users_project_owner
  users_project_editor = var.users_project_editor

  depends_on = [
    module.services
  ]
}
