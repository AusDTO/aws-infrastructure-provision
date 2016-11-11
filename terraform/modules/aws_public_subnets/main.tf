resource "aws_subnet" "public" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${element(var.cidrs, count.index)}"
  availability_zone       = "${element(var.azs, count.index)}"
  count                   = "${length(var.cidrs)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "${var.name}.${element(var.azs, count.index)}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"
  }

  tags {
    Name = "${var.name}.${element(var.azs, count.index)}"
  }
}

resource "aws_route_table_association" "public" {
  count          = "${length(var.cidrs)}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
