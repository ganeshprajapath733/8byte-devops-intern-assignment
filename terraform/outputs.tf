output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "ssh_command" {
  description = "SSH command to connect to EC2"
  value       = "ssh -i <your-key.pem> ubuntu@${aws_instance.web.public_ip}"
}


