
output "bosh_external_security_group_name" {
  value = "${aws_security_group.bosh_external.name}"
}
output "bosh_external_security_group_id" {
  value = "${aws_security_group.bosh_external.id}"
}
output "bosh_external_security_group_description" {
  value = "${aws_security_group.bosh_external.description}"
}
