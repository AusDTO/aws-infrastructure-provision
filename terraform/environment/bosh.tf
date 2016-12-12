module "s3_bucket" "bosh_artifacts" {
  source     = "../modules/aws_s3_bucket/private_bucket"
  bucket     = "ausdto-${var.stack_description}-bosh-artifacts"
  versioning = false
}


module "bosh_iam_user" {
  source               = "../modules/aws_iam_user/bosh_user"
  username             = "bosh-director"
  bosh-artifact-bucket = "${module.s3_bucket.arn}"
}

module "bosh_security_groups" {
  source                  = "../modules/aws_security_groups/bosh"
  stack_description       = "${var.stack_description}"
  vpc_id                  = "${module.vpc.vpc_id}"
  vpc_cidr                = "${var.vpc_cidr}"
  restricted_public_cidrs = ["${concat(var.restricted_public_cidrs, formatlist("%s/32", module.nat_gateways.nat_gateway_ips))}"]
}

resource "aws_key_pair" "bosh" {
  key_name   = "bosh"
  public_key = "${var.bosh_ssh_public_key}"
}

resource "aws_eip" "bosh" {
  vpc = true
}

module "rds_network" {
  source      = "../modules/rds_network"
  name        = "${var.stack_description}-rds"
  vpc_id      = "${module.vpc.vpc_id}"
  vpc_cidr    = "${var.vpc_cidr}"
  cidrs       = "${var.rds_cidrs}"
  azs         = "${var.aws_azs}"
  route_table = "${module.vpc.main_route_table_id}"
}

module "bosh_rds" {
  source = "../modules/rds"
  name = "${var.stack_description}-bosh"
  rds_instance_type = "db.t2.medium"
  rds_db_size = 5
  rds_db_storage_type = "standard"
  rds_db_name = "bosh"
  rds_db_engine = "postgres"
  rds_db_engine_version = "9.6.1"
  rds_username = "${var.bosh_rds_username}"
  rds_password = "${var.bosh_rds_password}"
  rds_subnet_group = "${module.rds_network.rds_subnet_group}"
  rds_security_groups = "${module.rds_network.rds_postgres_security_group}"
  rds_encrypted = false
}
