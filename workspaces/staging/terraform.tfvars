# File: terraform.tfvars

product_name = "product"

environment = "staging"

# AWS VPC CIDR address
vpc = {
  cidr_block = "172.26.16.0/20"
  name = "product-172.26.16.0/20"
}

public_subnets = [
  { # Subnet: product-us-east-1a (public)
    cidr_block = "172.26.16.0/24"
    availability_zone = "us-east-1a"
    name_tag = "product us-east-1a (public)"
  },
  { # Subnet: product-us-east-1b (public)
    cidr_block = "172.26.20.0/24"
    availability_zone = "us-east-1b"
    name_tag =  "product us-east-1b (public)"
  },
  { # Subnet: product-us-east-1c (public)
    cidr_block = "172.26.24.0/24"
    availability_zone = "us-east-1c"
    name_tag = "product us-east-1c (public)"
  },
  { # Subnet: product-us-east-1d (public)
    cidr_block = "172.26.28.0/24"
    availability_zone = "us-east-1d"
    name_tag = "product us-east-1d (public)"
  },
]

private_subnets = [
  { # Subnet: product-us-east-1a (private)
    cidr_block = "172.26.17.0/24"
    availability_zone = "us-east-1a"
    name_tag = "product us-east-1a (private)"
  },
  { # Subnet: product-us-east-1b (private)
    cidr_block = "172.26.21.0/24"
    availability_zone = "us-east-1b"
    name_tag =  "product us-east-1b (private)"
  },
  { # Subnet: product-us-east-1c (private)
    cidr_block = "172.26.25.0/24"
    availability_zone = "us-east-1c"
    name_tag = "product us-east-1c (private)"
  },
  { # Subnet: product-us-east-1d (private)
    cidr_block = "172.26.29.0/24"
    availability_zone = "us-east-1d"
    name_tag = "product us-east-1d (private)"
  },
]

data_subnets = [
  { # Subnet: product-us-east-1a (data)
    cidr_block = "172.26.18.0/24"
    availability_zone = "us-east-1a"
    name_tag = "product us-east-1a (data)"
  },
  { # Subnet: product-us-east-1b (data)
    cidr_block = "172.26.22.0/24"
    availability_zone = "us-east-1b"
    name_tag =  "product us-east-1b (data)"
  },
  { # Subnet: product-us-east-1c (data)
    cidr_block = "172.26.26.0/24"
    availability_zone = "us-east-1c"
    name_tag = "product us-east-1c (data)"
  },
  { # Subnet: product-us-east-1d (data)
    cidr_block = "172.26.30.0/24"
    availability_zone = "us-east-1d"
    name_tag = "product us-east-1d (data)"
  },
]

k8s_subnets = [
  { # Subnet: product-us-east-1a (k8s)
    cidr_block = "172.26.19.0/24"
    availability_zone = "us-east-1a"
    name_tag = "product us-east-1a (data)"
  },
  { # Subnet: product-us-east-1b (k8s)
    cidr_block = "172.26.23.0/24"
    availability_zone = "us-east-1b"
    name_tag =  "product us-east-1b (k8s)"
  },
  { # Subnet: product-us-east-1c (data)
    cidr_block = "172.26.27.0/24"
    availability_zone = "us-east-1c"
    name_tag = "product us-east-1c (k8s)"
  },
  { # Subnet: product-us-east-1d (data)
    cidr_block = "172.26.31.0/24"
    availability_zone = "us-east-1d"
    name_tag = "product us-east-1d (k8s)"
  },
]

# EOF terraform.tfvars
