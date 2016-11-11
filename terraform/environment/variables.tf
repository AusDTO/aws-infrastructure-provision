/*variable "aws_access_key_id" {
  type = "string"
}
variable "aws_secret_access_key" {
  type = "string"
}
variable "aws_region" {
  type    = "string"
  default =  "ap-southeast-2"
}*/
variable "aws_azs" {
  type    = "list"
  default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

variable "stack_description" {
  type    = "string"
  default =  "development"
}

variable "vpc_cidr" {
  type    = "string"
  default = "10.0.0.0/16"
}
variable "public_cidrs" {
  type    = "list"
}
variable "management_cidrs" {
  type    = "list"
}
variable "private1_cidrs" {
  type    = "list"
}
variable "private2_cidrs" {
  type    = "list"
}
variable "private3_cidrs" {
  type    = "list"
}
variable "rds_cidrs" {
  type    = "list"
}

variable "restricted_public_cidrs" {
  type = "list"
}

variable "bosh_ssh_public_key" {
  type = "string"
}

variable "bosh_region" {
  type    = "string"
  default = "ap-southeast-2"
}

variable "bosh_az" {
  type    = "string"
  default = "ap-southeast-2a"
}

variable "bosh_subnet_cidr" {
  type    = "string"
}
