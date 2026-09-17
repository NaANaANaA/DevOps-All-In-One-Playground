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
  filename = "${path.module}/rendered-${var.application_name}.json"
  content  = jsonencode(local.labels)
}
