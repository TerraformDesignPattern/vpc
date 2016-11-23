// Create Flowlog Cloudwatch Log Group
resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name = "${var.vpc_name}-vpc-flowlogs"
}
