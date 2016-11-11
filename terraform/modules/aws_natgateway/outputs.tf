
output "route_table_ids" {
  value = ["${aws_route_table.private.*.id}"]
}

output "nat_gateway_ips" {
  value = ["${aws_eip.nateip.*.public_ip}"]
}
