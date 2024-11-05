variable "project_id" {
  type        = string
  description = "Id of newly created project"
}

variable "users_project_editor" {
  type        = list(any)
  description = "User email accounts to be granted editor role in project scope."
}

variable "users_project_owner" {
  type        = list(any)
  description = "User email accounts to be granted owner role in project scope."
}
