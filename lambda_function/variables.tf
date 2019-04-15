variable "function_name" {
  description = "(Required) A unique name for your Lambda Function"
}

variable "publish" {
  default     = "true"
  description = "(Optional) Whether to publish creation/change as new Lambda Function Version."
}

variable "alias" {
  default     = "live"
  description = "Creates an alias that points to the specified Lambda function version"
}

variable "filename" {
  default     = ""
  description = "The zip file to upload containing the function code"
}

variable "handler" {
  description = "(Required) The function entrypoint in your code"
}

variable "runtime" {
  description = "(Required) See https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html for valid values."
}

variable "memory_size" {
  default     = 128
  description = "(Optional) Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128"
}

variable "timeout" {
  default     = 3
  description = "(Optional) The amount of time your Lambda Function has to run in seconds. Defaults to 3"
}

variable "env_vars" {
  type        = "map"
  default     = {}
  description = "(Optional) A map that defines environment variables for the Lambda function."
}

variable "retention_in_days" {
  default     = "14"
  description = "Default value for this functions cloudwatch logs group"
}

variable "subnet_ids" {
  type        = "list"
  default     = []
  description = "(Optional) Required for running the Lambda function in a VPC"
}

variable "security_group_ids" {
  type        = "list"
  default     = []
  description = "(Optional) Required for running the Lambda function in a VPC"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource"
}
