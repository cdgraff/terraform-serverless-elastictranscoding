resource "aws_sns_topic" "main_topic" {
  name = "${var.sns_topic_name}"
}

resource "aws_sns_topic_subscription" "main_topic_subscription" {
  topic_arn = "${aws_sns_topic.main_topic.arn}"
  protocol  = "${var.sns_subscription_protocol}"
  endpoint  = "${var.sns_subscription_endpoint}"
  endpoint_auto_confirms = "${var.sns_subscription_auto_confirms}"
}
