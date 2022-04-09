terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "prod-project-vpc" {
    cidr_block = "172.16.0.0/16"
    enable_dns_hostnames = true
    tags ={
        name="prod-project-vpc"

    }
}

output "vpcid" {
    description = "id of vpc"
    value = aws_vpc.prod-project-vpc.id
  
}
resource "aws_subnet" "public-a" {
    cidr_block = "172.16.1.0/24"
    vpc_id = aws_vpc.prod-project-vpc.id
    availability_zone = "us-east-1a"  
    map_public_ip_on_launch = true
    tags = {
      "key" = "public-a"
    }
  
}


resource "aws_subnet" "public-b" {
    cidr_block = "172.16.2.0/24"
    vpc_id = aws_vpc.prod-project-vpc.id
    availability_zone = "us-east-1b"  
    map_public_ip_on_launch = true
    tags = {
      "key" = "public-b"
    } 
}

resource "aws_subnet" "public-c" {
    cidr_block = "172.16.3.0/24"
    vpc_id = aws_vpc.prod-project-vpc.id
    availability_zone = "us-east-1c"  
    tags = {
      "key" = "public-c"
    } 
}

resource "aws_subnet" "private-a" {
    cidr_block = "172.16.4.0/24"
    vpc_id = aws_vpc.prod-project-vpc.id
    availability_zone = "us-east-1a"  
    tags = {
      "key" = "private-a"
    } 
}
resource "aws_subnet" "private-b" {
    cidr_block = "172.16.5.0/24"
    vpc_id = aws_vpc.prod-project-vpc.id
    availability_zone = "us-east-1b"  
    tags = {
      "key" = "private-b"
    } 
}

resource "aws_subnet" "private-c" {
    cidr_block = "172.16.6.0/24"
    vpc_id = aws_vpc.prod-project-vpc.id
    availability_zone = "us-east-1c"  
    tags = {
      "key" = "private-c"
    } 
}

resource "aws_subnet" "private-db1" {
    cidr_block = "172.16.8.0/24"
    vpc_id = aws_vpc.prod-project-vpc.id
    availability_zone = "us-east-1a"  
    tags = {
      "key" = "private-db1"
    } 
}

resource "aws_subnet" "private-db2" {
    cidr_block = "172.16.9.0/24"
    vpc_id = aws_vpc.prod-project-vpc.id
    availability_zone = "us-east-1b"  
    tags = {
      "key" = "private-db2"
    } 
}

resource "aws_subnet" "private-db3" {
    cidr_block = "172.16.10.0/24"
    vpc_id = aws_vpc.prod-project-vpc.id
    availability_zone = "us-east-1c"  
    tags = {
      "key" = "private-db3"
    } 
}