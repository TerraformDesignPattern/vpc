# VPC Module

This module is called within the `environments` module to create a new AWS VPC. 

## Example Usage

These files should be added to the VPC directory `environments/$ACCOUNT/$REGION/$VPC`

__main.tf__

```
module "vpc" {
  source = "git@github.com:TerraformDesignPattern/vpc.git"

  availability_zones = "${var.availability_zones}"
  aws_region = "${var.aws_region}"
  private_subnets = "${var.private_subnets}"
  public_subnets = "${var.public_subnets}"
  vpc_cidr = "${var.vpc_cidr}"
  vpc_name = "${var.vpc_name}"
}
```

__variables.tf__

As a personal preference, I try to only define data in variable files. 

```
variable "availability_zones" {
  default = ["us-east-1b", "us-east-1c", "us-east-1d"]
}

variable "aws_region" {
  default = "us-east-1"
}

variable "private_subnets" {
  default = [
    "172.19.101.0/24",
    "172.19.102.0/24",
    "172.19.103.0/24"
  ]
}

variable "public_subnets" {
  default = [
    "172.19.1.0/24",
    "172.19.2.0/24",
    "172.19.3.0/24"
  ]
}

variable "vpc_cidr" {
  default = "172.19.0.0/16"
}

variable "vpc_name" {
  default = "production-us-east-1-vpc"
}
```

__outputs.tf__

Export the module's outputs so environment service modules can use the state data.

```
output "internet_gateway_id" {
  value = "${module.vpc.internet_gateway_id}"
}

output "nat_eips" {
  value = ["${module.vpc.nat_eips}"]
}

output "private_route_table_ids" {
  value = ["${module.vpc.private_route_table_ids}"]
}

output "private_subnets" {
  value = ["${module.vpc.private_subnets}"]
}

output "public_route_table_ids" {
  value = ["${module.vpc.public_route_table_ids}"]
}

output "public_subnets" {
  value = ["${module.vpc.public_subnets}"]
}

output "vpc_cidr_block" {
  value = "${module.vpc.vpc_cidr_block}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}
```
