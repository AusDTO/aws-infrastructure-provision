/*
 * Variables required:
 *   stack_description
 *   vpc_id
 */


resource "aws_security_group" "rds_mysql" {
  description = "Allow access to incoming mysql traffic"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    /*cidr_blocks = ["0.0.0.0/0"]*/
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    /*cidr_blocks = ["0.0.0.0/0"]*/
    cidr_blocks = ["${var.vpc_cidr}"]
  }

  tags =  {
    Name = "${var.name} - Incoming MySQL Traffic"
  }

}
