variable "service-account-key-file" {
	type = string
	description = "Path to file containing the key of the service account used to create a new project scope"
}

variable "organization-id" {
	type = string
	description = "Id of the organization in which the project will be created."
}
