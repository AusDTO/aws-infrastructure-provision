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
  restricted_public_cidrs = ["${var.restricted_public_cidrs}"]
}

resource "aws_key_pair" "bosh" {
  key_name   = "bosh"
  public_key = "${var.bosh_ssh_public_key}"
}

resource "aws_eip" "bosh" {
  vpc = true
}
