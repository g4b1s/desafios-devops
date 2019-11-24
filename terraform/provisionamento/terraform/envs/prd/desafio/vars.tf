variable "region" {
  description = "região aws ex: us-east-1"
}

variable "ssh_cidr_blocks" {
  description = "ip liberado para ssh ex: 192.168.0.1/32"
}

variable "vpc_cidr_blocks" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  default = "10.0.0.0/22"
}

variable "aws_ec2_type" {
  default = "t2.micro"
}

variable "ssh_key_name" {
  default = "chave"
}

variable "tag_Name" {
  default = "DESAFIO"
}

variable "tag_Owner" {
  default = "idwall"
}

variable "tag_Group" {
  default = "developer1"
}

variable "aws_instance_ami" {
  default = "ami-006219aba10688d0b"
}