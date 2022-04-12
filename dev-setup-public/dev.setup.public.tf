terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "/home/raktim/.aws/credentials"
  profile                 = "tagrant"
  default_tags {
    tags = {
      #Environment = "Test"
      Name  = "tagrant"
      Owner = "mitkar241"
    }
  }
}

/*
provider "aws" {
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
*/

# Create a VPC
resource "aws_vpc" "tagrant" {
  cidr_block           = "10.0.0.0/24"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Description = "tagrant VPC"
  }
}

resource "aws_subnet" "tagrant" {
  vpc_id                  = aws_vpc.tagrant.id
  cidr_block              = "10.0.0.0/25"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Description = "tagrant subnet"
  }
}

resource "aws_internet_gateway" "tagrant" {
  vpc_id = aws_vpc.tagrant.id

  tags = {
    Description = "tagrant internet gateway"
  }
}

resource "aws_route_table" "tagrant" {
  vpc_id = aws_vpc.tagrant.id

  tags = {
    Description = "tagrant route table"
  }
}

resource "aws_route" "tagrant" {
  route_table_id         = aws_route_table.tagrant.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.tagrant.id
}

resource "aws_route_table_association" "tagrant" {
  subnet_id      = aws_subnet.tagrant.id
  route_table_id = aws_route_table.tagrant.id
}
