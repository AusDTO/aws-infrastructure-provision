resource "aws_s3_bucket" "bucket" {
    bucket = "${var.bucket}"
    acl = "${var.acl}"
    versioning {
        enabled = "${var.versioning}"
    }
}
