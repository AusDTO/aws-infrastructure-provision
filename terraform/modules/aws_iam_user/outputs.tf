output "username" {
  value = "${aws_iam_user.iam_user.name}"
}

output "access_key_id" {
  value = "${aws_iam_access_key.iam_access_key.id}"
}

output "secret_access_key" {
  value = "${aws_iam_access_key.iam_access_key.secret}"
}