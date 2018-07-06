variable "aws_account" {
  description = "The name of the AWS account in which the VPC is being created"
}

variable "aws_region" {
  description = "The name of the AWS region in which the VPC will be created"
}

variable "aws_region_shortnames" {
  default = {
    us-east-1      = "use1"
    us-east-2      = "use2"
    us-west-1      = "usw1"
    us-west-2      = "usw2"
    ap-south-1     = "aps1"
    ap-northeast-1 = "apne1"
    ap-northeast-2 = "apne2"
    ap-southeast-1 = "apse1"
    ap-southeast-2 = "apse2"
    ca-central-1   = "cac1"
    eu-central-1   = "euc1"
    eu-west-1      = "euw1"
    eu-west-2      = "euw2"
    sa-east-1      = "sae1"
  }
}

variable "vpc_cidr" {
  description = "Define the VPC CIDR block"
}

variable "vpc_name" {
  description = "The desired name of the VPC being created"
}

variable "availability_zones" {
  description = "The AWS availability zones in which subnets will be created"
  default     = []
}

variable "enable_dns_hostnames" {
  description = "True to enable DNS hostnames in the VPC"
  default     = true
}

variable "environment_name" {
  description = "Name of the enviornment the VPC belongs to"
}

variable "enable_dns_support" {
  description = "True to enable private DNS within the VPC"
  default     = true
}

variable "map_public_ip_on_launch" {
  description = "True to auto-assign a public IP on launch"
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
