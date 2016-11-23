output "internet_gateway_id" {
  value = "${aws_internet_gateway.internet_gateway.id}"
}

output "nat_eips" {
  value = ["${aws_eip.eip.*.id}"]
}

output "private_route_table_ids" {
  value = ["${aws_route_table.private_route_table.*.id}"]
}

output "private_subnets" {
  value = ["${aws_subnet.private_subnet.*.id}"]
}

output "public_route_table_ids" {
  value = ["${aws_route_table.public_route_table.*.id}"]
}

output "public_subnets" {
  value = ["${aws_subnet.public_subnet.*.id}"]
}

output "vpc_cidr_block" {
  value = "${aws_vpc.vpc.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}
