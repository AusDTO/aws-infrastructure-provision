
resource "aws_eip" "nateip" {
  vpc   = true
  count = "${length(var.azs)}"
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = "${element(aws_eip.nateip.*.id, count.index)}"
  subnet_id     = "${element(var.public_subnet_ids, count.index)}"
  count         = "${length(var.azs)}"
}


resource "aws_route_table" "private" {
  vpc_id = "${var.vpc_id}"
  count  = "${length(var.azs)}"

  tags {
    Name = "${var.name}-rt-private-${element(var.azs, count.index)}"
  }
}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = "${element(aws_route_table.private.*.id, count.index)}"
  nat_gateway_id         = "${element(aws_nat_gateway.natgw.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  count                  = "${length(var.azs)}"
}
