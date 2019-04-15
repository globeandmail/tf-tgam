variable "name" {
  type        = "string"
  description = "(Required) The name used to identify the codebuild role and policy"
}

variable "artifact_bucket" {
  type        = "string"
  description = "(Required) The name of the S3 bucket that codebuild will store build artifacts"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource"
}
