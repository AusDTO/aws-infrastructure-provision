variable "stack_description" {}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "restricted_public_cidrs" {
  default = ["127.0.0.1/32","192.168.0.1/24"]
  type = "list"
}

variable "vpc_id" {}
