# Create a custom VPC and its components :

# Create aws_vpc:
resource "aws_vpc" "CustomVpcR1" {
  cidr_block       = var.vpc_cidrR1
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "MyVpcR1"
  }
}

# Create an internet gateway :
resource "aws_internet_gateway" "CustomInternetGatewayR1" {
  vpc_id = aws_vpc.CustomVpcR1.id

  tags = {
    Name = "MyGatewayR1"
  }
}

# Create first public subnet :
resource "aws_subnet" "CustomPublicSubnet1R1" {
  vpc_id     = aws_vpc.CustomVpcR1.id
  cidr_block = var.PublicSubnet1_cidrR1
  availability_zone= "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet1R1"
  }
}

# Create Second public subnet :
resource "aws_subnet" "CustomPublicSubnet2R1" {
  vpc_id     = aws_vpc.CustomVpcR1.id
  cidr_block = var.PublicSubnet2_cidrR1
  availability_zone= "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet2R1"
  }
}
# Create a public route table 
resource "aws_route_table" "CustomerPublicRouteTableR1" {
  vpc_id = aws_vpc.CustomVpcR1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.CustomInternetGatewayR1.id
  }
  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
  tags = {
    Name = "PublicRouteTableR1"
  }
}
# Associate public route table to public subnet 1 
resource "aws_route_table_association" "PublicAssociationPublicSubnet1R1" {
  subnet_id      = aws_subnet.CustomPublicSubnet1R1.id
  route_table_id = aws_route_table.CustomerPublicRouteTableR1.id
}
# Associate public route table to public subnet 2
resource "aws_route_table_association" "PublicAssociationPublicSubnet2R1" {
  subnet_id      = aws_subnet.CustomPublicSubnet2R1.id
  route_table_id = aws_route_table.CustomerPublicRouteTableR1.id
}
















# Create first private subnet :
resource "aws_subnet" "CustomPrivateSubnet1R1" {
  vpc_id     = aws_vpc.CustomVpcR1.id
  cidr_block = var.PrivateSubnet1_cidrR1
  availability_zone= "us-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnet1R1"
  }
}

# Create Second private subnet :
resource "aws_subnet" "CustomPrivateSubnet2R1" {
  vpc_id     = aws_vpc.CustomVpcR1.id
  cidr_block = var.PrivateSubnet2_cidrR1
  availability_zone= "us-east-1d"
  map_public_ip_on_launch = false

  tags = {
    Name = "PrivateSubnet2R1"
  }
}



# Create an elastic IP :
resource "aws_eip" "ElasticIpR1" {
  domain   = "vpc"

  tags = {
    Name = "ElasticIpForNatGatewayR1"
  }
}
# Create a natgateway :
resource "aws_nat_gateway" "CustomNatGatewayR1" {
  allocation_id = aws_eip.ElasticIpR1.id
  subnet_id     = aws_subnet.CustomPublicSubnet1R1.id

  tags = {
    Name = "MyNatGatewayR1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.CustomInternetGatewayR1]
}
# Create a private route table 
resource "aws_route_table" "CustomerPrivateRouteTableR1" {
  vpc_id = aws_vpc.CustomVpcR1.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.CustomNatGatewayR1.id
  }
   route {
    cidr_block = "10.0.0.0/16"
    gateway_id = "local"
  }
  tags = {
    Name = "PrivateRouteTable"
  }
}
# Associate private route table to private subnet 1 
resource "aws_route_table_association" "PrivateAssociationPrivateSubnet1R1" {
  subnet_id      = aws_subnet.CustomPrivateSubnet1R1.id
  route_table_id = aws_route_table.CustomerPrivateRouteTableR1.id
}
# Associate private route table to private subnet 2
resource "aws_route_table_association" "PrivateAssociationPrivateSubnet2R1" {
  subnet_id      = aws_subnet.CustomPrivateSubnet2R1.id
  route_table_id = aws_route_table.CustomerPrivateRouteTableR1.id
}