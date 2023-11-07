# File: outputs.tf

output "product_name" {
  value = local.product_name
}

output "environment" {
  value = local.environment
}

output "cidr_block" {
  value = local.cidr_block
}
# EOF: outputs.tf