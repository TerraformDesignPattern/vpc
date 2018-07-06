# CREATE FLOWLOG IAM ROLE
resource "aws_iam_role" "flowlog_iam_role" {
  name = "${var.vpc_name}-flowlog"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
} 
EOF
}

# CREATE FLOWLOW IAM ROLE POLICY
resource "aws_iam_role_policy" "flowlog_iam_role_policy" {
  name = "${var.vpc_name}-flowlog-policy"
  role = "${aws_iam_role.flowlog_iam_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}   
EOF
}
