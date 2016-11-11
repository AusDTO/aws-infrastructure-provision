variable "name" {}

variable "vpc_id" {
  default = ""
}

variable "public_subnet_ids" {
  default = []
}

variable "az_count" {
  default = ""
}

variable "azs" {
  type = "list"
}
