# CREATE PRVIATE ROUTE
resource "aws_route" "private_route" {
  count                  = "${length(var.private_subnets)}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${element(aws_nat_gateway.nat_gateway.*.id, count.index)}"
  route_table_id         = "${element(aws_route_table.private_route_table.*.id, count.index)}"
}

# CREATE PRIVATE ROUTE TABLE
resource "aws_route_table" "private_route_table" {
  vpc_id           = "${aws_vpc.vpc.id}"
  propagating_vgws = ["${var.public_propagating_vgws}"]
  count            = "${length(var.private_subnets)}"

  tags {
    Name = "${var.vpc_name}-private-rt-${element(var.availability_zones, count.index)}"
    environment_name = "${var.environment_name}"
  }
}

# ASSOCIATE PRIVATE SUBNET WITH PRIVATE ROUTE TABLE
resource "aws_route_table_association" "private_route_table_association" {
  count          = "${length(var.private_subnets)}"
  subnet_id      = "${element(aws_subnet.private_subnet.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.private_route_table.*.id, count.index)}"
}

# CREATE PUBLIC AWS ROUTE
resource "aws_route" "public_aws_route" {
  route_table_id         = "${aws_route_table.public_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.internet_gateway.id}"
}

# CREATE PUBLIC ROUTE TABLE
resource "aws_route_table" "public_route_table" {
  vpc_id           = "${aws_vpc.vpc.id}"
  propagating_vgws = ["${var.public_propagating_vgws}"]

  tags {
    Name = "${var.vpc_name}-public-rt"
    environment_name = "${var.environment_name}"
  }
}

# ASSOCIATE PUBLIC SUBNET WITH PUBLIC ROUTE TABLE
resource "aws_route_table_association" "public_route_table_association" {
  count          = "${length(var.public_subnets)}"
  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.public_route_table.*.id, count.index)}"
}
