##########   VPC BUILD OUT   ##########
resource "aws_vpc" "vpc" {
 cidr_block      = "10.10.0.0/16"
 enable_dns_support  = true
 enable_dns_hostnames = true
 tags = {
  Name = "vpc-us-west-1"
 }
}

# Public and Private subnet 1a AZ
resource "aws_subnet" "public_subnet_a" {
 vpc_id         = aws_vpc.vpc.id
 cidr_block       = "10.10.10.0/24"
 availability_zone    = "us-west-1a"
 map_public_ip_on_launch = false
 tags = {
  Name = "subnet-pub-1a"
 }
}

resource "aws_subnet" "private_subnet_a" {
 vpc_id         = aws_vpc.vpc.id
 cidr_block       = "10.10.20.0/24"
 availability_zone    = "us-west-1a"
 tags = {
  Name = "subnet-priv-1a"
 }
}

# Public and Private subnet 1c AZ
resource "aws_subnet" "public_subnet_c" {
 vpc_id         = aws_vpc.vpc.id
 cidr_block       = "10.10.11.0/24"
 availability_zone    = "us-west-1c"
 map_public_ip_on_launch = false
 tags = {
  Name = "subnet-pub-1c"
 }
}
resource "aws_subnet" "private_subnet_c" {
 vpc_id         = aws_vpc.vpc.id
 cidr_block       = "10.10.21.0/24"
 availability_zone    = "us-west-1c"
 tags = {
  Name = "subnet-priv-1c"
 }
}

# Create a public internet gateway
resource "aws_internet_gateway" "internet_gateway" {
 vpc_id = aws_vpc.vpc.id
tags = {
  Name = "igw-public-traffic"
 }
}

# Create a public route table
resource "aws_route_table" "public_routetable" {
  vpc_id = aws_vpc.vpc.id
 route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.internet_gateway.id
 }
 tags = {
  Name = "rtb-public"
 }
}

resource "aws_main_route_table_association" "a" {
 vpc_id     = aws_vpc.vpc.id
 route_table_id = aws_route_table.public_routetable.id
}

# Subnet Associate to main route table
resource "aws_route_table_association" "public_subnet_a" {
 subnet_id   = aws_subnet.public_subnet_a.id
 route_table_id = aws_route_table.public_routetable.id
}
resource "aws_route_table_association" "public_subnet_c" {
 subnet_id   = aws_subnet.public_subnet_c.id
 route_table_id = aws_route_table.public_routetable.id
}