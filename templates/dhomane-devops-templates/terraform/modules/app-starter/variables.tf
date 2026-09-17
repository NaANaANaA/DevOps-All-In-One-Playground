variable "application_name" {
  description = "Logical application name used in generated metadata."
  type        = string
  default     = "example-app"
}

variable "namespace" {
  description = "Kubernetes namespace or deployment boundary name."
  type        = string
  default     = "example-app"
}

variable "environment" {
  description = "Environment label for generated outputs."
  type        = string
  default     = "dev"
}

variable "common_tags" {
  description = "Additional tags or labels to merge into generated metadata."
  type        = map(string)
  default     = {}
}

variable "write_example_file" {
  description = "When true, emit a small local file containing rendered metadata."
  type        = bool
  default     = false
}
