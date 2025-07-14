variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The trust policy JSON"
  type        = string
}

variable "description" {
  description = "Role description"
  type        = string
  default     = null
}

variable "policy_arns" {
  description = "List of managed policy ARNs to attach"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Optional tags for the role"
  type        = map(string)
  default     = {}
}
