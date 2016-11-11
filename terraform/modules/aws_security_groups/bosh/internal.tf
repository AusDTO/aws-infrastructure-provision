/*resource "aws_security_group" "bosh_internal" {
   description = "BOSH security group"
   vpc_id = "${var.vpc_id}"

   tags =  {
     Name = "${var.stack_description}-bosh-internal-traffic"
   }

 }

 resource "aws_security_group_rule" "self_reference" {
     type = "ingress"
     self = true
     from_port = 0
     to_port = 0
     protocol = -1
     security_group_id = "${aws_security_group.bosh_internal.id}"
 }

 resource "aws_security_group_rule" "bosh_ssh" {
     type = "ingress"
     from_port = 22
     to_port = 22
     protocol = "tcp"
     cidr_blocks = ["${var.vpc_cidr}"]
     security_group_id = "${aws_security_group.bosh_internal.id}"
 }

 resource "aws_security_group_rule" "dns" {
     type = "ingress"
     from_port = 53
     to_port = 53
     protocol = "tcp"
     cidr_blocks = ["${var.vpc_cidr}"]
     security_group_id = "${aws_security_group.bosh_internal.id}"
 }

 resource "aws_security_group_rule" "http_elb" {
     type = "ingress"
     from_port = 80
     to_port = 80
     protocol = "tcp"
     cidr_blocks = ["${var.vpc_cidr}"]
     security_group_id = "${aws_security_group.bosh_internal.id}"
 }

 resource "aws_security_group_rule" "cf_ssh" {
     type = "ingress"
     from_port = 4222
     to_port = 4222
     protocol = "tcp"
     cidr_blocks = ["${var.vpc_cidr}"]
     security_group_id = "${aws_security_group.bosh_internal.id}"
 }

 resource "aws_security_group_rule" "diego_ssh" {
     type = "ingress"
     from_port = 2222
     to_port = 2222
     protocol = "tcp"
     cidr_blocks = ["${var.vpc_cidr}"]
     security_group_id = "${aws_security_group.bosh_internal.id}"
 }

 resource "aws_security_group_rule" "bosh_nats" {
     type = "ingress"
     from_port = 6868
     to_port = 6868
     protocol = "tcp"
     cidr_blocks = ["${var.vpc_cidr}"]
     security_group_id = "${aws_security_group.bosh_internal.id}"
 }

 resource "aws_security_group_rule" "bosh_director" {
     type = "ingress"
     from_port = 25555
     to_port = 25555
     protocol = "tcp"
     cidr_blocks = ["${var.vpc_cidr}"]
     security_group_id = "${aws_security_group.bosh_internal.id}"
 }

 resource "aws_security_group_rule" "outbound" {
     type = "egress"
     from_port = 0
     to_port = 0
     protocol = -1
     cidr_blocks = ["0.0.0.0/0"]
     security_group_id = "${aws_security_group.bosh_internal.id}"
 }*/
