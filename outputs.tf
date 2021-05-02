output "public_ip01" {
  value       = aws_instance.amazon-machine[0].public_ip
  description = "The public IP of the Instance"
}

output "public_ip02" {
  value = aws_instance.amazon-machine[1].public_ip
}