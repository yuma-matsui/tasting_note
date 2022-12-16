resource "aws_eip" "nat_gateway" {
  for_each = toset(var.availability_zone)
  vpc      = true

  tags = {
    Name = "${var.project}-eip-${each.key}"
  }
}
