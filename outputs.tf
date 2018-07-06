output "aws_region_shortname" {
  value = "${lookup(var.aws_region_shortnames, var.aws_region)}"
}

output "flow_log_cloudwatch_log_group_arn" {
  value = "${aws_cloudwatch_log_group.cloudwatch_log_group.arn}"
}

output "flow_log_cloudwatch_log_group_name" {
  value = "${aws_cloudwatch_log_group.cloudwatch_log_group.name}"
}

output "internet_gateway_id" {
  value = "${aws_internet_gateway.internet_gateway.id}"
}

output "nat_eips" {
  value = ["${aws_eip.eip.*.id}"]
}

output "private_route_table_ids" {
  value = ["${aws_route_table.private_route_table.*.id}"]
}

output "private_subnet_ids" {
  value = ["${aws_subnet.private_subnet.*.id}"]
}

output "private_subnet_cidr_blocks" {
  value = ["${aws_subnet.private_subnet.*.cidr_block}"]
}

output "public_route_table_ids" {
  value = ["${aws_route_table.public_route_table.*.id}"]
}

output "public_subnet_cidr_blocks" {
  value = ["${aws_subnet.public_subnet.*.cidr_block}"]
}

output "public_subnet_ids" {
  value = ["${aws_subnet.public_subnet.*.id}"]
}

output "vpc_cidr_block" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
