
resource "aws_security_group" "concourse_external" {
  description = "Restricted Concourse type traffic"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 2222
    to_port = 2222
    protocol = "tcp"
    cidr_blocks = ["${var.restricted_public_cidrs}"]
  }

  ingress {
    from_port = 80
    to_port = 80
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
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["${var.restricted_public_cidrs}"]
  }

  ingress {
    from_port = 8443
    to_port = 8443
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
    Name = "${var.stack_description}-concourse-public-restricted-traffic"
  }

}
