variable "security_group_name" {
  description = "shh security group"
  type        = string
  default     = "terraform-webserver-instance"
}

variable "ssh_server_port" {
  description = "The port the server will use for ssh requests"
  type        = number
  default     = 22
}

variable "http_server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 80
}