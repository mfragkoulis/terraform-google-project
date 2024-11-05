# Export folder_id for use by root module
output "folder_id" {
  value = google_folder.project_folder.id
}
