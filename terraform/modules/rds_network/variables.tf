
variable "name" {}

variable "vpc_id" {}

variable "vpc_cidr" {}

variable "cidrs" {
  type = "list"
}

variable "azs" {
  type = "list"
}

variable "route_table" {
}
