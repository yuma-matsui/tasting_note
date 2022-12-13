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
resource "aws_subnet" "public" {
  for_each = {
    "1a" = "172.20.10.0/24"
    "1c" = "172.20.11.0/24"
  }

  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = "ap-northeast-${each.key}"
  cidr_block              = each.value
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project}-alb-public-${each.key}"
  }
}

resource "aws_subnet" "db_private" {
  for_each = {
    "1a" = "172.20.0.0/24"
    "1c" = "172.20.1.0/24"
    "1d" = "172.20.2.0/24"
  }

  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-northeast-${each.key}"
  cidr_block        = each.value

  tags = {
    Name = "${var.project}-db-private-${each.key}"
  }
}

resource "aws_subnet" "ecs_private" {
  for_each = {
    "1a" = "172.20.5.0/24"
    "1c" = "172.20.6.0/24"
  }

  vpc_id            = aws_vpc.vpc.id
  availability_zone = "ap-northeast-${each.key}"
  cidr_block        = each.value

  tags = {
    Name = "${var.project}-ecs-private-${each.key}"
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

resource "aws_route_table" "private_db_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-private-db-rt"
  }
}

resource "aws_route_table" "private_ecs_rt" {
  for_each = toset(var.availability_zone)
  vpc_id   = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-private-ecs-rt-${each.key}"
  }
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = each.value.id
}

resource "aws_route_table_association" "db_private" {
  for_each       = aws_subnet.db_private
  route_table_id = aws_route_table.private_db_rt.id
  subnet_id      = each.value.id
}

resource "aws_route_table_association" "ecs_private" {
  for_each       = toset(var.availability_zone)
  route_table_id = aws_route_table.private_ecs_rt[each.key].id
  subnet_id      = aws_subnet.ecs_private[each.key].id
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

resource "aws_route" "public_rt_igw_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# --------------------------
# NAT Gateway
# --------------------------
resource "aws_nat_gateway" "for_ecs" {
  for_each = toset(var.availability_zone)

  allocation_id = aws_eip.nat_gateway[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  tags = {
    Name = "${var.project}-nat-gateway-${each.key}"
  }

  depends_on = [
    aws_internet_gateway.igw
  ]
}

resource "aws_route" "private_rt_nat_gateway_route" {
  for_each               = toset(var.availability_zone)
  route_table_id         = aws_route_table.private_ecs_rt[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.for_ecs[each.key].id
}
