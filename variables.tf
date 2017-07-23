/* Generals config */
variable "product" { default = "test" }
variable "environment" { default = "stg" }

/* AWS Config*/
variable "aws_region" { default = "us-east-1" }
variable "aws_profile" { default = "default" }

/* S3 config */
variable "s3_video_in_bucket_name" { default = "video-in" }
variable "s3_video_in_bucket_acl" { default = "private" }
variable "s3_video_out_bucket_name" { default = "video-out" }
variable "s3_video_out_bucket_acl" { default = "public-read" }
variable "s3_thumbs_out_bucket_name" { default = "thumbs-out" }
variable "s3_thumbs_out_bucket_acl" { default = "public-read"}

/* SNS Config */
variable "sns_topic_name" { default = "video-notifications" }
variable "sns_subscription_protocol" { default = "http" }
variable "sns_subscription_endpoint" { default = "http://api.url.com/notification/endpoint" }

/* Elastictranscoder Config */
variable "elastictranscoder_pipeline_name" { default = "video-pipeline" }
