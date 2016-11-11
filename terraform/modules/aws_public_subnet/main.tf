resource "aws_subnet" "public" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${var.cidr}"
  availability_zone       = "${var.az}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name = "${var.name}.${var.az}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${var.vpc_id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${var.igw_id}"
  }

  tags {
    Name = "${var.name}.${var.az}"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public.id}"
  route_table_id = "${aws_route_table.public.id}"
}
