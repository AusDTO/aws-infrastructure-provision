
output "allow_all_internal_security_group_name" {
  value = "${aws_security_group.local_vpc_traffic.name}"
}
output "allow_all_internal_security_group_id" {
  value = "${aws_security_group.local_vpc_traffic.id}"
}
output "allow_all_internal_security_group_description" {
  value = "${aws_security_group.local_vpc_traffic.description}"
}
