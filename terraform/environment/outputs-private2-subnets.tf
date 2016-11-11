
output "private2_a_subnet_id" {
  value = "${element(module.private2_subnets.subnet_ids, 0)}"
}
output "private2_a_cidr" {
  value = "${element(var.private2_cidrs, 0)}"
}
output "private2_a_gateway" {
  value = "${cidrhost(element(var.private2_cidrs, 0), 1)}"
}
output "private2_a_dns" {
  value = "${cidrhost(element(var.private2_cidrs, 0), 2)}"
}
output "private2_a_reserved" {
  value = "${cidrhost(element(var.private2_cidrs, 0), 1)}-${cidrhost(element(var.private2_cidrs, 0), 6)}"
}
output "private2_a_static" {
  value = "${cidrhost(element(var.private2_cidrs, 0), 10)}-${cidrhost(element(var.private2_cidrs, 0), 40)}"
}

output "private2_b_subnet_id" {
  value = "${element(module.private2_subnets.subnet_ids, 1)}"
}
output "private2_b_cidr" {
  value = "${element(var.private2_cidrs, 1)}"
}
output "private2_b_gateway" {
  value = "${cidrhost(element(var.private2_cidrs, 1), 1)}"
}
output "private2_b_dns" {
  value = "${cidrhost(element(var.private2_cidrs, 1), 2)}"
}
output "private2_b_reserved" {
  value = "${cidrhost(element(var.private2_cidrs, 1), 1)}-${cidrhost(element(var.private2_cidrs, 1), 6)}"
}
output "private2_b_static" {
  value = "${cidrhost(element(var.private2_cidrs, 1), 10)}-${cidrhost(element(var.private2_cidrs, 1), 40)}"
}

output "private2_c_subnet_id" {
  value = "${element(module.private2_subnets.subnet_ids, 2)}"
}
output "private2_c_cidr" {
  value = "${element(var.private2_cidrs, 2)}"
}
output "private2_c_gateway" {
  value = "${cidrhost(element(var.private2_cidrs, 2), 1)}"
}
output "private2_c_dns" {
  value = "${cidrhost(element(var.private2_cidrs, 2), 2)}"
}
output "private2_c_reserved" {
  value = "${cidrhost(element(var.private2_cidrs, 2), 1)}-${cidrhost(element(var.private2_cidrs, 2), 6)}"
}
output "private2_c_static" {
  value = "${cidrhost(element(var.private2_cidrs, 2), 10)}-${cidrhost(element(var.private2_cidrs, 2), 40)}"
}
