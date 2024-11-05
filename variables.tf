variable "root-project-id" {
	type = string
	description = "Root project id"
	default = "grnet-tf-sandbox"
}

variable "service-account-key-file" {
	type = string
	description = "Path to file of service account key used to create project scopes."
	default = "./service-account-key.json"
}

variable "organization-id" {
	type = string
	description = "Id of the organization in which the new project will be created."
	default = "987298873606"
}

variable "project-folder-name" {
	type = string
	description = "Display name of the new project's folder"
	default = "Test project's folder"
}

variable "project-jail-folder-name" {
	type = string
	description = "Display name of the new project's jail folder"
	default = "Test project's jail folder"
}

variable "project-id" {
	type = string
	description = "Id of new project. It needs to be unique across GCP."
	default = "test-project-sandbox-2"
}

variable "project-name" {
	type = string
	description = "Display name of new project."
	default = "Test project"
}

variable "billing-account-id" {
	type = string
	description = "Alphanumeric id of the billing account associated with the new project."
	default = "123456"
}

variable "users-project-owner" {
	type = list
	description = "User email accounts to be granted owner role in project scope."
	default = ["user:mfg@grnet.gr"]
}

variable "users-project-editor" {
	type = list
	description = "User email accounts to be granted editor role in project scope."
	default = ["user:mfg@grnet.gr"]
}
