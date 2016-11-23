// Enable VPC Flowlog
resource "aws_flow_log" "flow_log" {
  log_group_name = "${replace(var.vpc_name, "-", "")}"
  iam_role_arn = "${aws_iam_role.flowlog_iam_role.arn}"
  vpc_id = "${aws_vpc.vpc.id}"
  traffic_type = "ALL"
}
