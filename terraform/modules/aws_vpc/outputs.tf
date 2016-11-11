
output "vpc_id" {
  value = "${aws_vpc.mod.id}"
}

output "default_security_group_id" {
  value = "${aws_vpc.mod.default_security_group_id}"
}

output "main_route_table_id" {
  value = "${aws_vpc.mod.main_route_table_id}"
}

output "vpc_igw_id" {
  value = "${aws_internet_gateway.mod.id}"
}
