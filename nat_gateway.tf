//Create NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  count         = "${length(var.private_subnets)}"
  allocation_id = "${element(aws_eip.eip.*.id, count.index)}"
  subnet_id     = "${element(aws_subnet.public_subnet.*.id, count.index)}"

  depends_on = ["aws_internet_gateway.internet_gateway"]
}
