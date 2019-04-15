variable "bucket_name" {
  description = "name of bucket to create"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource"
}
