output "public_ip" {
  description = "public ip fo ec2 instance"
  value = module.ec2.public_ip
}
