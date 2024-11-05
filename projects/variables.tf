variable "billing_account_id" {
  type        = string
  description = "Alphanumeric id of the billing account associated with the new project."
}

variable "folder_id" {
  type        = string
  description = "Folder id of newly created folder for project."
}

variable "project_id" {
  type        = string
  description = "Id of new project. It needs to be unique across GCP."
}

variable "project_name" {
  type        = string
  description = "Display name of new project."
}
