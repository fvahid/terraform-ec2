terraform {
  required_version = ">= 0.12, < 0.16"
}

provider "aws" {
  region = "us-east-2"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_instance" "amazon-machine" {
  ami           = "ami-05d72852800cbf29e"
  instance_type = "t2.micro"
  key_name = "ohio-region-key"
  vpc_security_group_ids = [aws_security_group.ingress.id]
  tags = {
    Name = "amazon-machine"
  }
}

resource "aws_security_group" "ingress" {

  name = var.security_group_name

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


