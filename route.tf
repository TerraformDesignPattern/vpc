resource "aws_route" "private_aws_route" {
  route_table_id         = "${element(aws_route_table.private_route_table.*.id, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.nat_gateway.*.id, count.index)}"
  count                  = "${length(var.private_subnets) * lookup(map(var.enable_nat_gateway, 1), "true", 0)}"
}

resource "aws_route" "public_aws_route" {
  route_table_id         = "${aws_route_table.public_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet_gateway.id}"
}
