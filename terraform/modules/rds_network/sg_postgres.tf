/*
 * Variables required:
 *   stack_description
 *   vpc_id
 */

resource "aws_security_group" "rds_postgres" {
  description = "Allow access to incoming postgresql traffic"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    /*cidr_blocks = ["0.0.0.0/0"]*/
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  tags =  {
    Name = "${var.name} - Incoming PostGreSQL Traffic"
  }

}
