
output "rds_subnet_group" {
    value = "${aws_db_subnet_group.rds.id}"
}

output "rds_mysql_security_group" {
  value = "${aws_security_group.rds_mysql.id}"
}

output "rds_postgres_security_group" {
  value = "${aws_security_group.rds_postgres.id}"
}
