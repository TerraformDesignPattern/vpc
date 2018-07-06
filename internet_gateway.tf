# CREATE INTERNET GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name = "${var.vpc_name}-internet-gw-${lookup(var.aws_region_shortnames, var.aws_region)}"
    environment_name = "${var.environment_name}"
  }
}
