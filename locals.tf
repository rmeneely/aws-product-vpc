# File: locals.tf

locals {
  product_name = "${var.product_name}"
  environment = "${var.environment}"
  cidr_block = "${var.vpc.cidr_block}"
  cidr-block = replace("${var.vpc.cidr_block}","/[./]/","-")
  resource_group = "${var.product_name}:${var.vpc.cidr_block}"
  vpc_name = "${var.vpc.name}"
}

# EOF: locals.tf
