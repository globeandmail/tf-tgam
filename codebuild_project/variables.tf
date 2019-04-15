variable "name" {
  type        = "string"
  description = "(Required) The projects name"
}

variable "build_image" {
  type        = "string"
  description = "(Required) The image identifier of the Docker image to use for this build project"
}

variable "codebuild_role_arn" {
  type        = "string"
  description = "(Required) The ARN of the role that enables CodeBuild to interact with dependent AWS services on behalf of the AWS account"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource"
}
