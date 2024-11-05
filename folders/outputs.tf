# Export folder_id for use by root module
output "folder-id" {
	value = google_folder.project-folder.id
}
