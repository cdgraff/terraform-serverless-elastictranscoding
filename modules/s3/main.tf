resource "aws_s3_bucket" "video_in_bucket" {
  bucket = "${var.s3_video_in_bucket_name}"
  acl    = "${var.s3_video_in_bucket_acl}"
}

resource "aws_s3_bucket" "video_out_bucket" {
  bucket = "${var.s3_video_out_bucket_name}"
  acl    = "${var.s3_video_out_bucket_acl}"
  #policy = "${file("policy.json")}"

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket" "thumbs_out_bucket" {
  bucket = "${var.s3_thumbs_out_bucket_name}"
  acl    = "${var.s3_thumbs_out_bucket_acl}"
  #policy = "${file("policy.json")}"

  website {
    index_document = "index.html"
  }
}
