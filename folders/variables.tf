variable "organization_id" {
  type        = string
  description = "Id of the organization in which the project will be created."
}

variable "project_folder_name" {
  type        = string
  description = "Display name of the new project's folder"
}

variable "project_jail_folder_name" {
  type        = string
  description = "Display name of the new project's jail folder"
}
