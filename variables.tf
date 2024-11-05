variable "billing_account_id" {
  type        = string
  description = "Alphanumeric id of the billing account associated with the new project."
  default     = "123456"
}

# This is the ID of the Grnet organization used for testing.
# Instead, it should be the id of the institution's organization or a folder therein passed as input to Terraform.
variable "parent_id" {
  type        = string
  description = "Id of the organization in which the new project will be created."
  default     = "987298873606"
}

variable "project_folder_name" {
  type        = string
  description = "Display name of the new project's folder"
  default     = "Folder of test project"
}

variable "project_id" {
  type        = string
  description = "Id of new project. It needs to be unique across GCP."
  default     = "test-project-sandbox-2"
}

variable "project_jail_folder_name" {
  type        = string
  description = "Display name of the new project's jail folder"
  default     = "Jail folder of test project"
}

variable "project_name" {
  type        = string
  description = "Display name of new project."
  default     = "Test project"
}

variable "root_project_id" {
  type        = string
  description = "Root project id"
  default     = "grnet-tf-sandbox"
}

variable "service_account_key_file" {
  type        = string
  description = "Path to file of service account key used to create project scopes."
  default     = "./service-account-key.json"
}

variable "users_project_editor" {
  type        = list(any)
  description = "User email accounts to be granted editor role in project scope."
  default     = ["user:mfg@grnet.gr"]
}

variable "users_project_owner" {
  type        = list(any)
  description = "User email accounts to be granted owner role in project scope."
  default     = ["user:mfg@grnet.gr"]
}
