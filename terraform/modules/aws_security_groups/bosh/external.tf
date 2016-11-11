
resource "aws_security_group" "bosh_external" {
  description = "Restricted bosh type traffic"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.restricted_public_cidrs}"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${var.restricted_public_cidrs}"]
  }

  ingress {
    from_port = 6868
    to_port = 6868
    protocol = "tcp"
    cidr_blocks = ["${var.restricted_public_cidrs}"]
  }

  ingress {
    from_port = 25555
    to_port = 25555
    protocol = "tcp"
    cidr_blocks = ["${var.restricted_public_cidrs}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags =  {
    Name = "${var.stack_description}-bosh-public-restricted-traffic"
  }

}
