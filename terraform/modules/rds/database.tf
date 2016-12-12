
resource "aws_db_instance" "rds_database" {
  engine               = "${var.rds_db_engine}"
  engine_version       = "${var.rds_db_engine_version}"

  multi_az = true

  lifecycle {
    ignore_changes = ["identifier"]
    // TODO: Restore `prevent_destroy` after https://github.com/hashicorp/terraform/issues/7728 is resolved
    // prevent_destroy = true
  }
  identifier = "${var.name}-${element(split("-", uuid()),4)}"

  backup_retention_period = 30

  auto_minor_version_upgrade = true
  auto_minor_version_upgrade = false

  name = "${var.rds_db_name}"
  allocated_storage = "${var.rds_db_size}"
  storage_type = "${var.rds_db_storage_type}"
  instance_class = "${var.rds_instance_type}"

  username = "${var.rds_username}"
  password = "${var.rds_password}"

  storage_encrypted = "${var.rds_encrypted}"

  db_subnet_group_name = "${var.rds_subnet_group}"
  vpc_security_group_ids = ["${split(",", var.rds_security_groups)}"]

  tags = {
    Name = "${var.name}"
  }
}
