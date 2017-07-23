resource "aws_elastictranscoder_pipeline" "my_elastictranscoder" {
  input_bucket = "${var.s3_video_in_bucket_name}"
  name         = "${var.elastictranscoder_pipeline_name}"
  role         = "${var.iam_role_arn}"

  content_config = {
    bucket        = "${var.s3_video_out_bucket_name}"
    storage_class = "Standard"
  }

  thumbnail_config = {
    bucket        = "${var.s3_thumbs_out_bucket_name}"
    storage_class = "Standard"
  }

  notifications = {
    completed    = "${var.sns_topic_notifications}"
    error        = "${var.sns_topic_notifications}"
    progressing  = "${var.sns_topic_notifications}"
    warning      = "${var.sns_topic_notifications}"
  }
}
