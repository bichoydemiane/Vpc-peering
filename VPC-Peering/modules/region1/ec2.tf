resource "aws_instance" "MyPublicServer1R1" {
  ami             = "ami-0c101f26f147fa7fd"
  instance_type   = "t2.micro"
  key_name        = "mykey1"
  subnet_id       = aws_subnet.CustomPublicSubnet1R1.id
  vpc_security_group_ids = [aws_security_group.PublicServerSGR1.id]
  tags  = {
    Name  = "MyPublicServer1R1"
  }
} 


resource "aws_instance" "MyPublicServer2R1" {
  ami             = "ami-0c101f26f147fa7fd"
  instance_type   = "t2.micro"
  key_name        = "mykey2"
  subnet_id       = aws_subnet.CustomPublicSubnet2R1.id
  vpc_security_group_ids = [aws_security_group.PublicServerSGR1.id]
  tags  = {
    Name  = "MyPublicServer2R1"
  }
} 


resource "aws_instance" "MyPrivateServer1R1" {
  ami             = "ami-0c101f26f147fa7fd"
  instance_type   = "t2.micro"
  key_name        = "mykey3"
  subnet_id       = aws_subnet.CustomPrivateSubnet1R1.id
  vpc_security_group_ids = [aws_security_group.PrivateServerSGR1.id]
  tags  = {
    Name  = "MyPrivateServer1R1"
  }
}

/*
resource "aws_instance" "MyPrivateServer2R1" {
  ami             = "ami-0c101f26f147fa7fd"
  instance_type   = "t2.micro"
  key_name        = "mykey4"
  subnet_id       = aws_subnet.CustomPrivateSubnet2R1.id
  vpc_security_group_ids = [aws_security_group.PrivateServerSGR1.id]
  tags  = {
    Name  = "MyPrivateServer2R1"
  }
} 
*/