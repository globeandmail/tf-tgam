variable "function_name" {
  type        = "string"
  description = "(Required) The name fo the Lambda Function"
}

variable "function_arn" {
  type        = "string"
  description = "(Required) The Amazon Resource Name (ARN) of the Lambda Function"
}

variable "schedule_expression" {
  type        = "string"
  description = "(Required) The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource"
}
