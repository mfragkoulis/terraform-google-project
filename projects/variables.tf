variable "project-id" {
	type = string
	description = "Id of new project. It needs to be unique across GCP."
}

variable "project-name" {
	type = string
	description = "Display name of new project."
}

variable "folder-id" {
	type = string
	description = "Folder id of newly created folder for project."
}

variable "billing-account-id" {
	type = string
	description = "Alphanumeric id of the billing account associated with the new project."
}
