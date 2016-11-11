
resource "aws_subnet" "private" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${element(var.cidrs, count.index)}"
  availability_zone       = "${element(var.azs, count.index)}"
  count                   = "${length(var.cidrs)}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "${var.name}-private-${element(var.azs, count.index)}"
  }
}

resource "aws_route_table_association" "private" {
  count          = "${length(var.cidrs)}"
  subnet_id      = "${element(aws_subnet.private.*.id, count.index)}"
  route_table_id = "${element(var.route_table_ids, count.index)}"
}
