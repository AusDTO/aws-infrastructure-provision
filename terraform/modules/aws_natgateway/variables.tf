variable "name" {}

variable "vpc_id" {
  default = ""
}

variable "public_subnet_ids" {
  default = []
}

variable "azs" {
  type = "list"
}
