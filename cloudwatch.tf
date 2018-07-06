# CREATE VPC FLOW LOG CLOUDWATCH LOG GROUP
resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name              = "${var.vpc_name}-flow-logs"
  retention_in_days = 7
}
