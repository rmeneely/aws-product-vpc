# File: aws_security_group.public.tf

# security_groups
resource "aws_security_group" "public" {
  name = "${var.product_name}-public"
  description = "${var.product_name} public layer security group"
  vpc_id = aws_vpc.product.id

  ingress { # ssh
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # https
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Private CIDR ranges
    description      = "Private CIDR ranges"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "${var.product_name} (public)"
      Component = "VPC"
      Terraform_resource = "aws_security_group.public"
    }
  )
}

# EOF: aws_security_group.public.tf
