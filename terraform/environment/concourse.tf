
resource "aws_eip" "concourse" {
  vpc = true
}

module "concourse_security_groups" {
  source                  = "../modules/aws_security_groups/concourse"
  stack_description       = "${var.stack_description}"
  vpc_id                  = "${module.vpc.vpc_id}"
  vpc_cidr                = "${var.vpc_cidr}"
  restricted_public_cidrs = ["${concat(var.restricted_public_cidrs, formatlist("%s/32", module.nat_gateways.nat_gateway_ips))}"]
}
