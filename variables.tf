# File: variables.tf
# Variables for module product-vpc

# Configure the AWS Provider
variable "aws_access_key_id" {
  type = string
}

variable "aws_secret_access_key" {
  type = string
}

#variable "github_personal_access_token" {
##}
#

variable "environment" {
  description = "The environment which to fetch the configuration for."
  type = string
}

variable "common_tags" {
  description = "Common tags to be set on each resource"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "product_name" {
  type = string
}

variable "vpc" {
  type = object({
    cidr_block = string
    name = string
  })
}

# public
variable "public_subnets" {
  type = list(object({
    cidr_block = string
    availability_zone = string
    name_tag = string
  }))
}

# private
variable "private_subnets" {
  type = list(object({
    cidr_block = string
    availability_zone = string
    name_tag = string
  }))
}

# data
variable "data_subnets" {
  type = list(object({
    cidr_block = string
    availability_zone = string
    name_tag = string
  }))
}

# k8s
variable "k8s_subnets" {
  type = list(object({
    cidr_block = string
    availability_zone = string
    name_tag = string
  }))
}

# EOF: variables.tf
