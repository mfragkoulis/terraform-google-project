variable "project" {
	type = string
	description = "Project name"
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
