# Configure

You can change the default configuration in `variables.tf` or from the command line.

# Execute

Login to Google Cloud Platform.

```bash
gcloud auth application-default login
```

Execute Terraform.

```bash
terraform apply
```

# Prerequisites

This terraform setup assumes access to a GCP organization resource with an active service account on which the user has owner role. It also assumes that the service account has been granted the following set of roles within the organization resource:
- roles/resourcemanager.folderCreator
- roles/resourcemanager.projectCreator
- roles/resourcemanager.projectIamAdmin
- roles/serviceusage.serviceUsageAdmin
- roles/resourcemanager.projectDeleter
- roles/resourcemanager.projectMover
- roles/billing.user may be required when specifying a billing account for a new project
