# Export project_id for use by root module.
# Could use var.project-id and omit this, but prefer to mark dependency explicitly.
output "project-id" {
	value = google_project.project.project_id
}
