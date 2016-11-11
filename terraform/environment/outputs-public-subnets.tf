
output "public_a_subnet_id" {
  value = "${element(module.public_subnets.subnet_ids, 0)}"
}
output "public_a_cidr" {
  value = "${element(var.public_cidrs, 0)}"
}
output "public_a_gateway" {
  value = "${cidrhost(element(var.public_cidrs, 0), 1)}"
}
output "public_a_dns" {
  value = "${cidrhost(element(var.public_cidrs, 0), 2)}"
}
output "public_a_reserved" {
  value = "${cidrhost(element(var.public_cidrs, 0), 1)}-${cidrhost(element(var.public_cidrs, 0), 6)}"
}
output "public_a_static" {
  value = "${cidrhost(element(var.public_cidrs, 0), 10)}-${cidrhost(element(var.public_cidrs, 0), 40)}"
}

output "public_b_subnet_id" {
  value = "${element(module.public_subnets.subnet_ids, 1)}"
}
output "public_b_cidr" {
  value = "${element(var.public_cidrs, 1)}"
}
output "public_b_gateway" {
  value = "${cidrhost(element(var.public_cidrs, 1), 1)}"
}
output "public_b_dns" {
  value = "${cidrhost(element(var.public_cidrs, 1), 2)}"
}
output "public_b_reserved" {
  value = "${cidrhost(element(var.public_cidrs, 1), 1)}-${cidrhost(element(var.public_cidrs, 1), 6)}"
}
output "public_b_static" {
  value = "${cidrhost(element(var.public_cidrs, 1), 10)}-${cidrhost(element(var.public_cidrs, 1), 40)}"
}

output "public_c_subnet_id" {
  value = "${element(module.public_subnets.subnet_ids, 2)}"
}
output "public_c_cidr" {
  value = "${element(var.public_cidrs, 2)}"
}
output "public_c_gateway" {
  value = "${cidrhost(element(var.public_cidrs, 2), 1)}"
}
output "public_c_dns" {
  value = "${cidrhost(element(var.public_cidrs, 2), 2)}"
}
output "public_c_reserved" {
  value = "${cidrhost(element(var.public_cidrs, 2), 1)}-${cidrhost(element(var.public_cidrs, 2), 6)}"
}
output "public_c_static" {
  value = "${cidrhost(element(var.public_cidrs, 2), 10)}-${cidrhost(element(var.public_cidrs, 2), 40)}"
}
