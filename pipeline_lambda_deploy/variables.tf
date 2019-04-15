variable "name" {
  type        = "string"
  description = "(Required) The name to be used for the codepipepline and codebuild projects"
}

variable "build_image" {
  type        = "string"
  description = "(Required) The image identifier of the Docker image to use for this build project"
}

variable "repo_owner" {
  type        = "string"
  description = "(Required) The name of the github username or company that owns the repository"
}

variable "repo_name" {
  type        = "string"
  description = "(Required) The name of the github repository"
}

variable "branch_name" {
  type        = "string"
  default     = "master"
  description = "(Optional) The git branch name to use for the codebuild project"
}

variable "oauth_token" {
  type        = "string"
  description = "(Required) The generated oath token from github"
}

variable "function_alias" {
  type        = "string"
  default     = "live"
  description = "(Optional) The name of the Lambda function alias that gets passed to the UserParameters data in the deploy stage"
}

variable "artifact_bucket" {
  type        = "string"
  description = "(Required) The name of the S3 bucket that codebuild will store build artifacts"
}

variable "codebuild_role_arn" {
  type        = "string"
  description = "(Required) The ARN of the role that enables CodeBuild to interact with dependent AWS services on behalf of the AWS account"
}

variable "codepipeline_role_arn" {
  type        = "string"
  description = "(Required) The ARN of the role that enables CodePipeline to interact with dependent AWS services on behalf of the AWS account"
}

variable "deploy_function_name" {
  default     = "CodepipelineDeploy"
  description = "(Optional) The name of the Lambda function in the account that will update the function code"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource"
}
