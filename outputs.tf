output "public_ip" {
  value       = aws_instance.amazon-machine.public_ip
  description = "The public IP of the Instance"
}