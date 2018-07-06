# ENABLE VPC FLOWLOG
resource "aws_flow_log" "flow_log" {
  log_group_name = "${aws_cloudwatch_log_group.cloudwatch_log_group.name}"
  iam_role_arn   = "${aws_iam_role.flowlog_iam_role.arn}"
  vpc_id         = "${aws_vpc.vpc.id}"
  traffic_type   = "ALL"
}
