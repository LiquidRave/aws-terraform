terraform {
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.27"
      }
  }

required_version = ">= 0.14.9"
}

provider "aws" {
    profile = "default"
    region = "eu-central-1"
}

resource "aws_budgets_budget" "top_kek" {
    name = "monthyl-budget"
    budget_type = "COST"
    limit_amount = "10.0"
    limit_unit = "USD"
    time_unit = "MONTHLY"
    time_period_start = "2021-09-28_00:01"
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    tags = {
        Name = "main"
    }
}

resource "aws_subnet" "main" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.0.0/24"
}

resource "aws_route_table" "route_table1" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
}
resource "aws_security_group" "allow_all" {
    vpc_id = aws_vpc.main.id
    description = "allow all"
    ingress {
      description      = "open all"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
    }
  tags = {
    Name = "allow_ssh"
  }
}
resource "aws_key_pair" "deployer" {
  key_name   = "aws"
  public_key = var.pub_key
}

resource "aws_instance" "haproxy_load_balancer" {
    instance_type = var.server_type
    ami = var.ami
    subnet_id = aws_subnet.main.id
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    key_name = "aws"
    tags = {
        Name = "haproxy_loadbalancer"
    }
}

resource "aws_instance" "webserver1" {
    instance_type = var.server_type 
    ami = var.ami
    subnet_id = aws_subnet.main.id
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    key_name = "aws"
    tags = {
        Name = "webserver1"
    }
}
resource "aws_instance" "webserver2" {
    instance_type = var.server_type 
    subnet_id = aws_subnet.main.id
    ami = var.ami
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    key_name = "aws"
    tags = {
        Name = "webserver2"
    }
}
