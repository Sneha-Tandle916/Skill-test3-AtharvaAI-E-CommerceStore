output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "Public IPv4 address of the application"
  value       = aws_instance.app.public_ip
}

output "frontend_url" {
  description = "URL of the e-commerce frontend"
  value       = "http://${aws_instance.app.public_ip}"
}
