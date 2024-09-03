output "aws_instance" {
  value       = aws_instance.app_server.id
  description = "the EC2 instance ID"
}
