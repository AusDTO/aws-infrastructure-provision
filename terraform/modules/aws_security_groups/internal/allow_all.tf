
resource "aws_security_group" "local_vpc_traffic" {
  description = "Enable access to all VPC CIDR block ips"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags =  {
    Name = "${var.stack_description}-allow-all-local-traffic"
  }
}
