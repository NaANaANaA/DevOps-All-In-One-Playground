output "labels" {
  description = "Rendered labels for downstream modules and manifest generation."
  value       = local.labels
}

output "metadata_file" {
  description = "Optional local file path when write_example_file is enabled."
  value       = try(local_file.metadata[0].filename, null)
}
