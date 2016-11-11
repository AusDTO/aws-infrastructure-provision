module "bosh_user" {
  source = ".."

  username = "${var.username}"
  iam_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3Access",
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
          "${var.bosh-artifact-bucket}/*"
      ]
    },
    {
      "Sid": "BoshDeployments",
      "Effect": "Allow",
      "Action": [
        "ec2:*",
        "elasticloadbalancing:*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}
