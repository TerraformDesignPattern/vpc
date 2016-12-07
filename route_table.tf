// Create Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id           = "${aws_vpc.vpc.id}"
  propagating_vgws = ["${var.public_propagating_vgws}"]
  count            = "${length(var.private_subnets)}"

  tags {
    Name = "${var.vpc_name}-private-rt-${element(var.availability_zones, count.index)}"
  }
}

// Create Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id           = "${aws_vpc.vpc.id}"
  propagating_vgws = ["${var.public_propagating_vgws}"]

  tags {
    Name = "${var.vpc_name}-public-rt"
  }
}
