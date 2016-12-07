// Create Public Subnet Association with Public Route Table
resource "aws_route_table_association" "public_route_table_association" {
  count          = "${length(var.public_subnets)}"
  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public_route_table.*.id, count.index)}"
}

// Create Private Subnet Association with Private route table
resource "aws_route_table_association" "private_route_table_association" {
  count          = "${length(var.private_subnets)}"
  subnet_id      = "${element(aws_subnet.private_subnet.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private_route_table.*.id, count.index)}"
}
