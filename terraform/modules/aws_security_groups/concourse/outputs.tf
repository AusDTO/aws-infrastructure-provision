
output "concourse_external_security_group_name" {
  value = "${aws_security_group.concourse_external.name}"
}
output "concourse_external_security_group_id" {
  value = "${aws_security_group.concourse_external.id}"
}
output "concourse_external_security_group_description" {
  value = "${aws_security_group.concourse_external.description}"
}
