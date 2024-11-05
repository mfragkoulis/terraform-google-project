# Export project_id for use by root module.
# Could use var.project_id and omit this, but prefer to mark dependency explicitly.
output "project_id" {
  value = google_project.project.project_id
}
