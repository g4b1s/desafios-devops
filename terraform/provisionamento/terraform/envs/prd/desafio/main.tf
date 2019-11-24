provider "aws" {
  region = "${var.region}"
}

data "aws_availability_zones" "available" {}


module "vpc" {
  source = "../../../modules/vpc"

  cidr = "${var.vpc_cidr_blocks}"

  azs                 = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  public_subnets      = ["${var.subnet_cidr_blocks}"]
  # private_subnets     = []

  enable_ipv6 = false
  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "${var.tag_Name}_public_subnet"
  }

  tags = {
    Owner       = "${var.tag_Owner}"
    Environment = "${var.tag_Group}"
  }

  vpc_tags = {
    Name = "${var.tag_Name}_vpc"
  }
}

module "security_group" {
  source  = "../../../modules/security-group"

  name        = "${var.tag_Name}_sg"
  description = "Security group for ec2"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http ports"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    description = "https ports"
    cidr_blocks = "0.0.0.0/0"
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ssh ports"
    cidr_blocks = "${var.ssh_cidr_blocks}"
  }
  ]
  egress_rules        = ["all-all"]
}


module "ec2" {
  source         = "../../../modules/ec2"
  instance_count = 1

  name          = "${var.tag_Name}_ec2"
  ami           = "${var.aws_instance_ami}"
  key_name       = "${var.ssh_key_name}"

  instance_type = "${var.aws_ec2_type}"
  subnet_ids     = module.vpc.public_subnets

  vpc_security_group_ids      = [module.security_group.this_security_group_id]
  associate_public_ip_address = true

  tags = {
     Name         = "${var.tag_Name}_ec2"
     Group        = "${var.tag_Group}"
     Owner        = "${var.tag_Owner}"
  }
}

resource "null_resource" "ansible_playbook" {
  depends_on = [module.ec2.public_ip]
  provisioner "local-exec" {
    command = "ansible-playbook install_playbook.yml --extra-vars='@inventory/group_vars/all.yml'"
  }
}
