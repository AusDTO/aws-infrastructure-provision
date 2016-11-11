
output "management_a_subnet_id" {
  value = "${element(module.management_subnets.subnet_ids, 0)}"
}
output "management_a_cidr" {
  value = "${element(var.management_cidrs, 0)}"
}
output "management_a_gateway" {
  value = "${cidrhost(element(var.management_cidrs, 0), 1)}"
}
output "management_a_dns" {
  value = "${cidrhost(element(var.management_cidrs, 0), 2)}"
}
output "management_a_reserved" {
  value = "${cidrhost(element(var.management_cidrs, 0), 1)}-${cidrhost(element(var.management_cidrs, 0), 6)}"
}
output "management_a_static" {
  value = "${cidrhost(element(var.management_cidrs, 0), 10)}-${cidrhost(element(var.management_cidrs, 0), 40)}"
}

output "management_b_subnet_id" {
  value = "${element(module.management_subnets.subnet_ids, 1)}"
}
output "management_b_cidr" {
  value = "${element(var.management_cidrs, 1)}"
}
output "management_b_gateway" {
  value = "${cidrhost(element(var.management_cidrs, 1), 1)}"
}
output "management_b_dns" {
  value = "${cidrhost(element(var.management_cidrs, 1), 2)}"
}
output "management_b_reserved" {
  value = "${cidrhost(element(var.management_cidrs, 1), 1)}-${cidrhost(element(var.management_cidrs, 1), 6)}"
}
output "management_b_static" {
  value = "${cidrhost(element(var.management_cidrs, 1), 10)}-${cidrhost(element(var.management_cidrs, 1), 40)}"
}

output "management_c_subnet_id" {
  value = "${element(module.management_subnets.subnet_ids, 2)}"
}
output "management_c_cidr" {
  value = "${element(var.management_cidrs, 2)}"
}
output "management_c_gateway" {
  value = "${cidrhost(element(var.management_cidrs, 2), 1)}"
}
output "management_c_dns" {
  value = "${cidrhost(element(var.management_cidrs, 2), 2)}"
}
output "management_c_reserved" {
  value = "${cidrhost(element(var.management_cidrs, 2), 1)}-${cidrhost(element(var.management_cidrs, 2), 6)}"
}
output "management_c_static" {
  value = "${cidrhost(element(var.management_cidrs, 2), 10)}-${cidrhost(element(var.management_cidrs, 2), 40)}"
}
