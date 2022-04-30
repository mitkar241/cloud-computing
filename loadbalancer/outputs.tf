/*
terraform output
*/
output "instance-pub-ip" {
  value       = aws_instance.tagrant.public_ip
  sensitive   = false
  description = "instance public IP output"
  depends_on  = []
}
