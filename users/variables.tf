variable "project-id" {
	type = string
	description = "Id of newly created project"
}

variable "users-project-owner" {
	type = list
	description = "User email accounts to be granted owner role in project scope."
}

variable "users-project-editor" {
	type = list
	description = "User email accounts to be granted editor role in project scope."
}
