locals {
  labels = merge(
    {
      app         = var.application_name
      environment = var.environment
      namespace   = var.namespace
      managed_by  = "terraform"
    },
    var.common_tags,
  )
}

resource "local_file" "metadata" {
  count    = var.write_example_file && var.metadata_output_path != null ? 1 : 0
  filename = var.metadata_output_path
  content  = jsonencode(local.labels)
}
