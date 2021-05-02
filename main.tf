terraform {
  required_version = ">= 0.12, < 0.16"
}

provider "aws" {
  region = "us-east-2"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

resource "aws_instance" "amazon-machine" {
  count = 2
  ami           = "ami-05d72852800cbf29e"
  instance_type = "t2.micro"
  key_name = "ohio-region-key"
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y 
              systemctl restart httpd
              systemctl enable httpd
              echo "hello amazon ec2" > /var/www/html/index.html
              EOF
  vpc_security_group_ids = [aws_security_group.webserver.id]
  tags  = {
    Name = "webserver"
    OS = "Amazon"
    Application = "Web Server"
  }
}

resource "aws_security_group" "webserver" {

  name = var.security_group_name

  ingress {
    from_port   = var.ssh_server_port
    to_port     = var.ssh_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = var.http_server_port
    to_port     = var.http_server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


