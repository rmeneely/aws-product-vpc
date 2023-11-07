# File: aws_network_acl.public.tf

# network_acls
resource "aws_network_acl" "public" {
  vpc_id = aws_vpc.product.id
  subnet_ids = data.aws_subnets.public.ids

  egress { # All outbound
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress { # Private CIDR 10.0.0.0/8
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "10.0.0.0/8"
    from_port  = 0
    to_port    = 0
  }
  ingress { # Private CIDR 172.16.0.0/12
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "172.16.0.0/12"
    from_port  = 0
    to_port    = 0
  }
  ingress { # Private CIDR 192.168.0.0/16
    protocol   = "-1"
    rule_no    = 300
    action     = "allow"
    cidr_block = "192.168.0.0/16"
    from_port  = 0
    to_port    = 0
  }
  ingress { # ephemeral ports
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
  ingress { # http
    protocol   = "tcp"
    rule_no    = 500
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress { # https
    protocol   = "tcp"
    rule_no    = 600
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  ingress { # http 8080
    protocol   = "tcp"
    rule_no    = 700
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8080
    to_port    = 8080
  }
  ingress { # https 8443
    protocol   = "tcp"
    rule_no    = 800
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8443
    to_port    = 8443
  }
  ingress { # ssh
    protocol   = "tcp"
    rule_no    = 900
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
  ingress { # smtp
    protocol   = "tcp"
    rule_no    = 1000
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 25
    to_port    = 25
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} (public)"
      Terraform_resource = "aws_network_acl.public"
    }
  )
}

# EOF: aws_network_acl.public.tf
