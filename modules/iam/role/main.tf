resource "aws_iam_role" "my_elastictranscoder_iam_role" {
  name = "${var.product}_${var.environment}_${var.elastictranscoder_pipeline_name}"
  path = "/${var.product}/${var.environment}/"
  assume_role_policy = <<EOF
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "1",
          "Effect": "Allow",
          "Action": [
              "s3:ListBucket",
              "s3:Put*",
              "s3:Get*",
              "s3:*MultipartUpload*"
          ],
          "Resource": [
              "${var.s3_video_in_bucket_arn}",
              "${var.s3_video_out_bucket_arn}",
              "${var.s3_thumbs_out_bucket_arn}"
          ]
      },
      {
          "Sid": "2",
          "Effect": "Allow",
          "Action": [
              "sns:Publish"
          ],
          "Resource": [
              "${var.sns_topic_arn}"
          ]
      },
      {
          "Sid": "3",
          "Effect": "Deny",
          "Action": [
              "s3:*Policy*",
              "sns:*Permission*",
              "sns:*Delete*",
              "s3:*Delete*",
              "sns:*Remove*"
          ],
          "Resource": [
              "*"
          ]
      }
  ]
}
EOF
}
