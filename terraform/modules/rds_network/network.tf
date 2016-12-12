
resource "aws_subnet" "rds" {
  vpc_id                  = "${var.vpc_id}"
  cidr_block              = "${element(var.cidrs, count.index)}"
  availability_zone       = "${element(var.azs, count.index)}"
  count                   = "${length(var.cidrs)}"

  lifecycle {
   create_before_destroy = true
  }

  tags {
   Name = "${var.name}-rds-${element(var.azs, count.index)}"
  }
}


resource "aws_db_subnet_group" "rds" {
  name        = "${var.name}"
  description = "${var.name} (Multi-AZ Subnet Group)"
  subnet_ids  = ["${aws_subnet.rds.*.id}"]
}
