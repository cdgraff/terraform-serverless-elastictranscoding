resource "aws_iam_role_policy" "my_elastictranscoder_iam_role_policy" {
  name = "${var.product}_${var.environment}_${var.elastictranscoder_pipeline_name}"
  role = "${aws_iam_role.my_elastictranscoder_iam_role.id}"

  policy = <<EOF
{
  	"Version": "2008-10-17",
  	"Statement": [{
    		"Effect": "Allow",
    		"Action": ["s3:Put*", "s3:ListBucket", "s3:*MultipartUpload*", "s3:Get*"],
    		"Resource": "*"
  	}, {
    		"Effect": "Allow",
    		"Action": "sns:Publish",
    		"Resource": "*"
  	}, {
    		"Effect": "Deny",
    		"Action": ["s3:*Delete*", "s3:*Policy*", "sns:*Remove*", "sns:*Delete*", "sns:*Permission*"],
    		"Resource": "*"
  	}]
}
EOF
}

resource "aws_iam_role" "my_elastictranscoder_iam_role" {
  name = "${var.product}_${var.environment}_${var.elastictranscoder_pipeline_name}"
  path = "/${var.product}/${var.environment}/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
}
EOF
}
