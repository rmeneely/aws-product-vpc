# File: aws_security_group.k8s.tf

# security_groups
resource "aws_security_group" "k8s" {
  name = "${var.product_name}-k8s"
  description = "${var.product_name} k8s layer security group"
  vpc_id = aws_vpc.product.id

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
      Name = "${var.product_name} (k8s)"
      Terraform_resource = "aws_security_group.k8s"
    }
  )
}

# EOF: aws_security_group.k8s.tf
