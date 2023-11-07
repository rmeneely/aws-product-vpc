# File: aws_network_acl.private.tf

# network_acls
resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.product.id
  subnet_ids = data.aws_subnets.private.ids

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

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} (private)"
      Terraform_resource = "aws_network_acl.private"
    }
  )
}

# EOF: aws_network_acl.private.tf
