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
  count    = var.write_example_file ? 1 : 0
  filename = coalesce(var.metadata_output_path, "${path.root}/rendered-${var.application_name}.json")
  content  = jsonencode(local.labels)
}
