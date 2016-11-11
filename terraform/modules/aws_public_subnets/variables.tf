variable "name" {
  default = "public"
}

variable "cidrs" {
  default = []
}

variable "azs" {
  description = "A list of availability zones"
  default     = []
}

variable "vpc_id" {
}

variable "igw_id" {
}

variable "map_public_ip_on_launch" {
  default = false
}
