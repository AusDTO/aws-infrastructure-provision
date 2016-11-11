variable "name" {
  default = "public"
}

variable "vpc_id" {
}

variable "cidrs" {
  default = []
}

variable "azs" {
  description = "A list of availability zones"
  default     = []
}

variable "route_table_ids" {
  description = "A list route tables for each AZ"
  default     = []
}
