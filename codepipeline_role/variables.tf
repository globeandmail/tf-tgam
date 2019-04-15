variable "name" {
  type        = "string"
  description = "(Required) The name used to identify the codepipeline role and policy"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource"
}
