terraform {
  required_version = ">= 0.12, < 0.16"
}

provider "aws" {
  region = "us-east-2"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_instance" "example" {
  ami           = "ami-05d72852800cbf29e"
  instance_type = "t2.micro"
  key_name = "ohio-region-key"
  vpc_security_group_ids = [aws_security_group.ssh.id]
  tags = {
    Name = "baseapi-example"
  }
}

resource "aws_security_group" "ssh" {

  name = var.security_group_name

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "security_group_name" {
  description = "shh security group"
  type        = string
  default     = "terraform-ssh-instance"
}
