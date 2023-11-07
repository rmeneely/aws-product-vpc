# File: aws_security_group.redis.tf

# security_groups
resource "aws_security_group" "redis" {
  name = "${var.product_name}-redis"
  description = "${var.product_name} redis security group"
  vpc_id = aws_vpc.product.id

  ingress { # Private CIDR ranges
    description      = "Private CIDR ranges"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Active-Active management (internal)
    description      = "Active-Active management (internal)"
    from_port        = 9081
    to_port          = 9081
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # REST API traffic, including cluster management and node bootstrap
    description      = "REST API traffic, including cluster management and node bootstrap"
    from_port        = 9443
    to_port          = 9443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # REST API traffic, including cluster management and node bootstrap
    description      = "REST API traffic, including cluster management and node bootstrap"
    from_port        = 8080
    to_port          = 8080
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # System health monitoring
    description      = "System health monitoring"
    from_port        = 8002
    to_port          = 8002
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # System health monitoring
    description      = "System health monitoring"
    from_port        = 8004
    to_port          = 8004
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # System health monitoring
    description      = "System health monitoring"
    from_port        = 8006
    to_port          = 8006
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Redis Discovery Service
    description      = "Redis Discovery Service"
    from_port        = 8001
    to_port          = 8001
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # mDNS
    description      = "mDNS"
    from_port        = 5353
    to_port          = 5353
    protocol         = "UDP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Database shard traffic
    description      = "Database shard traffic"
    from_port        = 20000
    to_port          = 29999
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Traffic between web proxy and cnm_http/cm
    description      = "Traffic between web proxy and cnm_http/cm"
    from_port        = 8444
    to_port          = 8444
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Internode communication
    description      = "Internode communication"
    from_port        = 3333
    to_port          = 3344
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Connectivity checking between nodes
    description      = "Connectivity checking between nodes"
    from_port        = 0
    to_port          = 0
    protocol         = "ICMP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Database traffic
    description      = "Database traffic"
    from_port        = 10000
    to_port          = 19999
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Redis Metrics
    description      = "Redis Metrics"
    from_port        = 8070
    to_port          = 19999
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Secure HTTPS to management UI
    description      = "Secure HTTPS to management UI"
    from_port        = 8443
    to_port          = 8443
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # DNS
    description      = "DNS"
    from_port        = 53
    to_port          = 53
    protocol         = "UDP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # SSH
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Redis connection
    description      = "Redis connection"
    from_port        = 6379
    to_port          = 6379
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # Proxy traffic
    description      = "Proxy traffic"
    from_port        = 1968
    to_port          = 1968
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress { # self
    description      = "Self"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    self             = true
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
      Name = "${var.product_name} (redis)"
      Terraform_resource = "aws_security_group.redis"
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

# EOF: aws_security_group.redis.tf
