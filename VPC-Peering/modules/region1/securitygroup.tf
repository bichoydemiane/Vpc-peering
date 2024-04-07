resource "aws_security_group" "PublicServerSGR1" {
  name        = "PublicServerSG"
  vpc_id      = aws_vpc.CustomVpcR1.id
  tags = {
    Name = "PublicServerSGR1"
  }
ingress {
    description       = "enable inbound ssh from my PC"
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = [var.MyPublicIpR1]
}
ingress {
    description       = "enable inbound ping from a public subnets in the same vpc"
    from_port         = -1
    to_port           = -1
    protocol          = "icmp"
    self              = true
  }
ingress {
    description       = "enable inbound ping from a public subnets in the same vpc"
    from_port         = -1
    to_port           = -1
    protocol          = "icmp"
    cidr_blocks       = ["20.0.0.0/16"]
}
egress {
    description       = "enable outbound for all"
    from_port         = 0
    to_port           = 0
    protocol          = -1
    cidr_blocks       = ["0.0.0.0/0"]
}
}
resource "aws_security_group" "PrivateServerSGR1" {
  name        = "PrivateServerSGR1"
  vpc_id      = aws_vpc.CustomVpcR1.id
  tags = {
    Name = "PrivateServerSGR1"
  }
  ingress {
    description       = "enable inbound ping from a public subnets in the same vpc"
    from_port         = -1
    to_port           = -1
    protocol          = "icmp"
    security_groups   = [aws_security_group.PublicServerSGR1.id]
  }
  ingress {
    description       = "enable inbound ping from a private subnets in the same vpc"
    from_port         = -1
    to_port           = -1
    protocol          = "icmp"
    self              = true
  }
  ingress {
    description       = "enable inbound ping from a public subnets in the same vpc"
    from_port         = -1
    to_port           = -1
    protocol          = "icmp"
    cidr_blocks       = ["20.0.0.0/16"]
}
  egress {
    description       = "enable outbound for all"
    from_port         = 0
    to_port           = 0
    protocol          = -1
    cidr_blocks       = ["0.0.0.0/0"]
  }

}