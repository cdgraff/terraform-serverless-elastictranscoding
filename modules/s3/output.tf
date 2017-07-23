output "video_in_bucket_arn" {
  value = "${aws_s3_bucket.video_in_bucket.arn}"
}

output "video_out_bucket_arn" {
  value = "${aws_s3_bucket.video_out_bucket.arn}"
}

output "thumbs_out_bucket_arn" {
  value = "${aws_s3_bucket.thumbs_out_bucket.arn}"
}
