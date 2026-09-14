output "app_server_public_ip" {
  description = "Public IP of the app server"
  value       = aws_instance.app.public_ip
}

output "app_server_id" {
  description = "Instance ID of the app server"
  value       = aws_instance.app.id
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}