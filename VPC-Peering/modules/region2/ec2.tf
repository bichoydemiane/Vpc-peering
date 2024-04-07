resource "aws_instance" "MyPublicServer1R2" {
  ami             = "ami-0900fe555666598a2"
  instance_type   = "t2.micro"
  key_name        = "mykeyone"
  subnet_id       = aws_subnet.CustomPublicSubnet1R2.id
  vpc_security_group_ids = [aws_security_group.PublicServerSGR2.id]
  tags  = {
    Name  = "MyPublicServer1R2"
  }
} 

resource "aws_instance" "MyPublicServer2R2" {
  ami             = "ami-0900fe555666598a2"
  instance_type   = "t2.micro"
  key_name        = "mykeytwo"
  subnet_id       = aws_subnet.CustomPublicSubnet2R2.id
  vpc_security_group_ids = [aws_security_group.PublicServerSGR2.id]
  tags  = {
    Name  = "MyPublicServer2R2"
  }
} 


resource "aws_instance" "MyPrivateServer1R2" {
  ami             = "ami-0900fe555666598a2"
  instance_type   = "t2.micro"
  key_name        = "mykeythree"
  subnet_id       = aws_subnet.CustomPrivateSubnet1R2.id
  vpc_security_group_ids = [aws_security_group.PrivateServerSGR2.id]
  tags  = {
    Name  = "MyPrivateServer1R2"
  }
} 

