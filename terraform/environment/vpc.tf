
module "vpc" {
  source =             "../modules/aws_vpc"
  name                 = "${var.stack_description}"
  cidr                 = "${var.vpc_cidr}"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
}

module "nat_gateways" {
  source            = "../modules/aws_natgateway"
  name              = "${var.stack_description}"
  vpc_id            = "${module.vpc.vpc_id}"
  public_subnet_ids = ["${module.public_subnets.subnet_ids}"]
  azs               = "${var.aws_azs}"
  az_count          = "${length(var.aws_azs)}"
}
module "allow_all_internal_security_groups" {
  source                  = "../modules/aws_security_groups/internal"
  stack_description       = "${var.stack_description}"
  vpc_id                  = "${module.vpc.vpc_id}"
  vpc_cidr                = "${var.vpc_cidr}"
}

module "bosh_subnet" {
  source                  = "../modules/aws_public_subnets"
  name                    = "${var.stack_description}-bosh"
  vpc_id                  = "${module.vpc.vpc_id}"
  cidrs                   = ["${var.bosh_subnet_cidr}"]
  azs                     = ["${var.bosh_az}"]
  igw_id                  = "${module.vpc.vpc_igw_id}"
  map_public_ip_on_launch = false
}

module "public_subnets" {
  source                  = "../modules/aws_public_subnets"
  name                    = "${var.stack_description}-public"
  vpc_id                  = "${module.vpc.vpc_id}"
  cidrs                   = "${var.public_cidrs}"
  azs                     = "${var.aws_azs}"
  igw_id                  = "${module.vpc.vpc_igw_id}"
  map_public_ip_on_launch = false
}

module "management_subnets" {
  source          = "../modules/aws_private_subnets"
  name            = "${var.stack_description}-management"
  vpc_id          = "${module.vpc.vpc_id}"
  cidrs           = "${var.management_cidrs}"
  azs             = "${var.aws_azs}"
  route_table_ids = "${module.nat_gateways.route_table_ids}"
}
module "private1_subnets" {
  source          = "../modules/aws_private_subnets"
  name            = "${var.stack_description}-private1"
  vpc_id          = "${module.vpc.vpc_id}"
  cidrs           = "${var.private1_cidrs}"
  azs             = "${var.aws_azs}"
  route_table_ids = "${module.nat_gateways.route_table_ids}"
}
module "private2_subnets" {
  source          = "../modules/aws_private_subnets"
  name            = "${var.stack_description}-private2"
  vpc_id          = "${module.vpc.vpc_id}"
  cidrs           = "${var.private2_cidrs}"
  azs             = "${var.aws_azs}"
  route_table_ids = "${module.nat_gateways.route_table_ids}"
}
module "private3_subnets" {
  source          = "../modules/aws_private_subnets"
  name            = "${var.stack_description}-private3"
  vpc_id          = "${module.vpc.vpc_id}"
  cidrs           = "${var.private3_cidrs}"
  azs             = "${var.aws_azs}"
  route_table_ids = "${module.nat_gateways.route_table_ids}"
}
