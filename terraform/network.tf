# --------------------------
# VPC
# --------------------------
resource "aws_vpc" "vpc" {
  cidr_block                       = "172.20.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "${var.project}-vpc"
  }
}
# --------------------------
# Subnet
# --------------------------
resource "aws_subnet" "public_1a" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "172.20.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-public-1a"
  }
}
resource "aws_subnet" "public_1c" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-1c"
  cidr_block              = "172.20.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-public-1c"
  }
}
resource "aws_subnet" "private_1a" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1a"
  cidr_block        = "172.20.3.0/24"

  tags = {
    Name = "${var.project}-private-1a"
  }
}
resource "aws_subnet" "private_1c" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1c"
  cidr_block        = "172.20.4.0/24"

  tags = {
    Name = "${var.project}-private-1c"
  }
}
resource "aws_subnet" "private_1d" {
  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-northeast-1d"
  cidr_block        = "172.20.5.0/24"

  tags = {
    Name = "${var.project}-private-1d"
  }
}
# --------------------------
# Route table
# --------------------------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-public-rt"
  }
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-private-rt"
  }
}
resource "aws_route_table_association" "public_rt_1a" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_1a.id
}
resource "aws_route_table_association" "public_rt_1c" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_1c.id
}
resource "aws_route_table_association" "private_rt_1a" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private_1a.id
}
resource "aws_route_table_association" "private_rt_1c" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private_1c.id
}
resource "aws_route_table_association" "private_rt_1d" {
  route_table_id = aws_route_table.private_rt.id
  subnet_id      = aws_subnet.private_1d.id
}
# --------------------------
# Internet Gateway
# --------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-igw"
  }
}
resource "aws_route" "public_rt-_igw_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
