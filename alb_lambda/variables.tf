variable "name" {
  type        = "string"
  description = "(Reqired) The name identifying the load balamcer and target group(s)"
}

variable "function_arn" {
  type        = "string"
  description = "(Reqired) The ARN identifying your Lambda Function"
}

variable "http_server" {
  default     = false
  description = "(Optional) If set to true, create the HTTP listner on port 80"
}

variable "https_server" {
  default     = false
  description = "(Optional) If set to true, create an HTTPS listner on port 443"
}

variable "certificate_arn" {
  type        = "string"
  description = "(Optional) The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS"
}

variable "enable_deletion_protection" {
  default     = true
  description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer"
}

variable "internal" {
  default     = false
  description = "(Optional) If true, the LB will be internal."
}

variable "security_groups" {
  type        = "list"
  description = "(Reqired) A list of security group IDs to assign to the LB"
}

variable "subnets" {
  type        = "list"
  description = "(Reqired) A list of subnet IDs to attach to the LB"
}

variable "ssl_policy" {
  type        = "string"
  default     = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  description = "(Optional) The name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "(Optional) A mapping of tags to assign to the resource"
}
