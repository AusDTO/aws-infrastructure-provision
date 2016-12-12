
variable "name" {}

variable "rds_instance_type" {
    default = "db.m3.medium"
}

variable "rds_db_size" {
    default = 5
}

variable "rds_db_storage_type" {
    default = "standard"
}

variable "rds_db_name" {
    default = "bosh"
}

variable "rds_db_engine" {
    default = "postgres"
}

variable "rds_db_engine_version" {
    default = "9.4.5"
}

variable "rds_username" {
    default = "postgres"
}

variable "rds_password" {}

variable "rds_subnet_group" {}

variable "rds_security_groups" {}

variable "rds_encrypted" {
    default = true
}
