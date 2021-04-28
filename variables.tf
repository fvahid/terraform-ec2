variable "security_group_name" {
  description = "shh security group"
  type        = string
  default     = "terraform-ssh-instance"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 22
}