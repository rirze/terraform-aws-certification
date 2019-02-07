### Outputs

output "instance-ip" {
  value = "The IP for the actual instance is at http://${aws_instance.app.public_ip}"
}
output "dns" {
  value = "Hosted at http://${aws_alb.main.dns_name}"
}
