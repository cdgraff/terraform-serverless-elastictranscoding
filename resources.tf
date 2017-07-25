/*** AWS Provider ***/
provider "aws" {
  region = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

module "iam_role" {
  source = "./modules/iam/role"
  s3_video_in_bucket_arn = "${module.s3_bucket.video_in_bucket_arn}"
  s3_video_out_bucket_arn = "${module.s3_bucket.video_out_bucket_arn}"
  s3_thumbs_out_bucket_arn = "${module.s3_bucket.thumbs_out_bucket_arn}"
  sns_topic_arn = "${module.sns_topic.arn}"
  elastictranscoder_pipeline_name = "${var.elastictranscoder_pipeline_name}"
  product = "${var.product}"
  environment = "${var.environment}"
}

module "sns_topic" {
  source = "./modules/sns"
  sns_topic_name = "${var.product}-${var.environment}-${var.sns_topic_name}"
  sns_subscription_protocol = "${var.sns_subscription_protocol}"
  sns_subscription_endpoint = "${module.sqs_queue.arn}"
}

module "s3_bucket" {
  source = "./modules/s3"
  s3_video_in_bucket_name = "${var.product}-${var.environment}-${var.s3_video_in_bucket_name}"
  s3_video_in_bucket_acl = "${var.s3_video_in_bucket_acl}"
  s3_video_out_bucket_name = "${var.product}-${var.environment}-${var.s3_video_out_bucket_name}"
  s3_video_out_bucket_acl = "${var.s3_video_out_bucket_acl}"
  s3_thumbs_out_bucket_name = "${var.product}-${var.environment}-${var.s3_thumbs_out_bucket_name}"
  s3_thumbs_out_bucket_acl = "${var.s3_thumbs_out_bucket_acl}"
}

module "elastictranscoder_pipeline" {
  source = "./modules/elastictranscoder"
  sns_topic_notifications = "${module.sns_topic.arn}"
  s3_video_in_bucket_name = "${var.product}-${var.environment}-${var.s3_video_in_bucket_name}"
  s3_video_out_bucket_name = "${var.product}-${var.environment}-${var.s3_video_out_bucket_name}"
  s3_thumbs_out_bucket_name = "${var.product}-${var.environment}-${var.s3_thumbs_out_bucket_name}"
  elastictranscoder_pipeline_name = "${var.product}-${var.environment}-${var.elastictranscoder_pipeline_name}"
  iam_role_arn = "${module.iam_role.arn}"
}

module "sqs_queue" {
  source = "./modules/sqs"
  sqs_name = "${var.product}-${var.environment}-${var.sqs_name}"
}
