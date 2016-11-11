# details for bosh deployment of concourse
output "concourse_eip" {
  value = "${aws_eip.concourse.public_ip}"
}

output "concourse_security_group" {
  value = "${module.concourse_security_groups.concourse_external_security_group_id}"
}

output "nat_gateway_ips" {
  value = "${module.nat_gateways.nat_gateway_ips}"
}
