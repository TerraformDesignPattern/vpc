variable "aws_region" {}

variable "vpc_cidr" {}

variable "vpc_name" {}

variable "availability_zones" {
  default = []
}

variable "enable_dns_hostnames" {
  description = "True to use private DNS within the VPC"
  default     = true
}

variable "enable_dns_support" {
  description = "True to use private DNS within the VPC"
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "True to auto-assign public IP on launch"
  default     = true
}

variable "private_propagating_vgws" {
  description = "A list of VGWs the private route table should propagate."
  default     = []
}

variable "private_subnets" {
  default = []
}

variable "public_propagating_vgws" {
  description = "A list of VGWs the public route table should propagate."
  default     = []
}

variable "public_subnets" {
  default = []
}
