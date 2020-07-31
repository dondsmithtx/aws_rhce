resource "aws_security_group" "private" {
  name 		= "private"
  vpc_id 	= aws_vpc.lab.id

  ingress {
    protocol = -1
    from_port	= 0
    to_port	= 0
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    protocol	= -1
    from_port	= 0
    to_port	= 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "centos7-1" {
  ami	        	 	= "ami-0014eb7a3248c9cc7"
  instance_type		 	= "t2.micro"
  associate_public_ip_address 	= false
  vpc_security_group_ids	= ["${aws_security_group.private.id}"]
  subnet_id			= aws_subnet.west-2a.id
  key_name			= aws_key_pair.aws.id

  tags = {
    Name = "centos7-1"
  }
}

resource "aws_instance" "centos7-2" {
  ami	        	 	= "ami-0014eb7a3248c9cc7"
  instance_type		 	= "t2.micro"
  associate_public_ip_address 	= false
  vpc_security_group_ids	= ["${aws_security_group.private.id}"]
  subnet_id			= aws_subnet.west-2a.id
  key_name			= aws_key_pair.aws.id

  tags = {
    Name = "centos7-2"
  }
}
