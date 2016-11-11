variable "name" {
  default = "public"
}

variable "cidr" {
}

variable "az" {
  description = "availability zone"
}

variable "vpc_id" {
}

variable "igw_id" {
}

variable "map_public_ip_on_launch" {
  default = true
}
