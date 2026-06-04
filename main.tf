terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.46.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "ap-southeast-1"
}

resource "aws_instance" "my_first_server" {
  ami           = "ami-0576ef8e344fbf536"
  instance_type = "t4g.nano"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "production-vpc"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "production-subnet"
  }
}

# resource "<provider>_<resource_type>" "name" {
#       config option
#       key = "value"
#       key2 = "another value"
#}