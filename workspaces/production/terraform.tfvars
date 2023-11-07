# File: terraform.tfvars

product_name = "product"

environment = "production"

# AWS VPC CIDR address
vpc = {
  cidr_block = "172.27.16.0/20"
  name = "product-172.27.16.0/20"
}

public_subnets = [
  { # Subnet: product-us-east-1a (public)
    cidr_block = "172.27.16.0/24"
    availability_zone = "us-east-1a"
    name_tag = "product us-east-1a (public)"
  },
  { # Subnet: product-us-east-1b (public)
    cidr_block = "172.27.20.0/24"
    availability_zone = "us-east-1b"
    name_tag =  "product us-east-1b (public)"
  },
  { # Subnet: product-us-east-1c (public)
    cidr_block = "172.27.24.0/24"
    availability_zone = "us-east-1c"
    name_tag = "product us-east-1c (public)"
  },
  { # Subnet: product-us-east-1d (public)
    cidr_block = "172.27.28.0/24"
    availability_zone = "us-east-1d"
    name_tag = "product us-east-1d (public)"
  },
]

private_subnets = [
  { # Subnet: product-us-east-1a (private)
    cidr_block = "172.27.17.0/24"
    availability_zone = "us-east-1a"
    name_tag = "product us-east-1a (private)"
  },
  { # Subnet: product-us-east-1b (private)
    cidr_block = "172.27.21.0/24"
    availability_zone = "us-east-1b"
    name_tag =  "product us-east-1b (private)"
  },
  { # Subnet: product-us-east-1c (private)
    cidr_block = "172.27.25.0/24"
    availability_zone = "us-east-1c"
    name_tag = "product us-east-1c (private)"
  },
  { # Subnet: product-us-east-1d (private)
    cidr_block = "172.27.29.0/24"
    availability_zone = "us-east-1d"
    name_tag = "product us-east-1d (private)"
  },
]

data_subnets = [
  { # Subnet: product-us-east-1a (data)
    cidr_block = "172.27.18.0/24"
    availability_zone = "us-east-1a"
    name_tag = "product us-east-1a (data)"
  },
  { # Subnet: product-us-east-1b (data)
    cidr_block = "172.27.22.0/24"
    availability_zone = "us-east-1b"
    name_tag =  "product us-east-1b (data)"
  },
  { # Subnet: product-us-east-1c (data)
    cidr_block = "172.27.26.0/24"
    availability_zone = "us-east-1c"
    name_tag = "product us-east-1c (data)"
  },
  { # Subnet: product-us-east-1d (data)
    cidr_block = "172.27.30.0/24"
    availability_zone = "us-east-1d"
    name_tag = "product us-east-1d (data)"
  },
]

k8s_subnets = [
  { # Subnet: product-us-east-1a (k8s)
    cidr_block = "172.27.19.0/24"
    availability_zone = "us-east-1a"
    name_tag = "product us-east-1a (data)"
  },
  { # Subnet: product-us-east-1b (k8s)
    cidr_block = "172.27.23.0/24"
    availability_zone = "us-east-1b"
    name_tag =  "product us-east-1b (k8s)"
  },
  { # Subnet: product-us-east-1c (data)
    cidr_block = "172.27.27.0/24"
    availability_zone = "us-east-1c"
    name_tag = "product us-east-1c (k8s)"
  },
  { # Subnet: product-us-east-1d (data)
    cidr_block = "172.27.31.0/24"
    availability_zone = "us-east-1d"
    name_tag = "product us-east-1d (k8s)"
  },
]

# EOF terraform.tfvars
