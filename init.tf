provider "google" {
	project = "grnet-tf-sandbox"
}

resource "google_service_account" "cloud-access" {
	account_id = "cloud-access-id"
	display_name = "Service Account for setting up cloud access"
	project = "grnet-tf-sandbox"
}

resource "google_service_account_key" "cloud-access-key" {
	service_account_id = google_service_account.cloud-access.name
	public_key_type = "TYPE_X509_PEM_FILE"
	depends_on = [google_service_account.cloud-access]
}

# Save the private key to a local file
resource "local_file" "cloud-access-private-key-file" {
	content  = google_service_account_key.cloud-access-key.private_key
	filename = "${path.module}/private-key.json"
}


# Output a message guiding users on handling the private key securely
output "private_key_instructions" {
  value = <<-EOT
The private key has been saved to private-key.json. Handle it securely.
Also issue the following command in the shell to allow Terraform to use the service account for authentication in the next steps.

export TF_VAR_GOOGLE_APPLICATION_CREDENTIALS="${path.module}/private-key.json"
EOT
}

module "projects" {
	source = "./projects"

	service-account-private-key = google_service_account_key.cloud-access-key.private_key
}
