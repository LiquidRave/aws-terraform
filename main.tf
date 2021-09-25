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

resource "aws_instance" "haproxy_load_balancer" {
    instance_type = "t2.micro"
    #os ubuntu 20.04 
    ami = "ami-05f7491af5eef733a"
    tags = {
        Name = "haproxy_loadbalancer"
    }
}

resource "aws_instance" "web-server1" {
    instance_type = "t2.micro"
    #os ubuntu 20.04 
    ami = "ami-05f7491af5eef733a"
    tags = {
        Name = "webserver1"
    }
}
resource "aws_instance" "webserver2" {
    instance_type = "t2.micro"
    #os ubuntu 20.04 
    ami = "ami-05f7491af5eef733a"
    tags = {
        Name = "webserver2"
    }
}
#comment
