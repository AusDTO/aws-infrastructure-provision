# details for bosh-init
output "bosh_eip" {
  value = "${aws_eip.bosh.public_ip}"
}
output "bosh_az" {
  value = "${var.bosh_az}"
}
output "bosh_region" {
  value = "${var.bosh_region}"
}
output "bosh_subnet_cidr" {
  value = "${var.bosh_subnet_cidr}"
}
output "bosh_subnet_id" {
  value = "${element(module.bosh_subnet.subnet_ids, 0)}"
}
output "bosh_subnet_ip" {
  value = "${cidrhost(var.bosh_subnet_cidr, 6)}"
}
output "bosh_subnet_gateway" {
  value = "${cidrhost(var.bosh_subnet_cidr, 1)}"
}
output "bosh_subnet_dns" {
  value = "${cidrhost(var.bosh_subnet_cidr, 2)}"
}
output "bosh_security_groups" {
  value = "[${module.bosh_security_groups.bosh_external_security_group_id},${module.allow_all_internal_security_groups.allow_all_internal_security_group_id}]"
}
output "bosh_user_access_key_id" {
  value = "${module.bosh_iam_user.access_key_id}"
  sensitive = true
}
output "bosh_user_secret_access_key" {
  value = "${module.bosh_iam_user.secret_access_key}"
  sensitive = true
}
output "bosh_keypair_name" {
  value = "${aws_key_pair.bosh.key_name}"
}
output "bosh_s3_bucket_id" {
  value = "${module.s3_bucket.id}"
}

# output for bosh cloud-config
output "aws_az1" {
  value = "${element(var.aws_azs, 0)}"
}
output "aws_az2" {
  value = "${element(var.aws_azs, 1)}"
}
output "aws_az3" {
  value = "${element(var.aws_azs, 2)}"
}


output "bosh_rds_host" {
  value = "${module.bosh_rds.rds_url}"
}
