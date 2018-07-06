# CREATE NAT GATEWAY EIPS
resource "aws_eip" "eip" {
  count = "${length(var.private_subnets)}"
  vpc   = true
}
