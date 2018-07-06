# CREATE PRIVATE SUBNET
resource "aws_subnet" "private_subnet" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.private_subnets[count.index]}"
  availability_zone       = "${var.availability_zones[count.index]}"
  count                   = "${length(var.private_subnets)}"
  map_public_ip_on_launch = false

  tags {
    Name = "${var.vpc_name}-private-subnet-${element(var.availability_zones, count.index)}"
    environment_name = "${var.environment_name}"
  }
}

# CREATE PUBLIC SUBNET
resource "aws_subnet" "public_subnet" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnets[count.index]}"
  availability_zone       = "${var.availability_zones[count.index]}"
  count                   = "${length(var.public_subnets)}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"

  tags {
    Name = "${var.vpc_name}-public-subnet-${element(var.availability_zones, count.index)}"
    environment_name = "${var.environment_name}"
  }
}
