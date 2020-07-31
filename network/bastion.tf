resource "aws_security_group" "bastion-sg" {
  name 		= "bastion-sg"
  vpc_id 	= aws_vpc.lab.id

  ingress {
    protocol	= "tcp"
    from_port	= 22
    to_port	= 22
    cidr_blocks = ["98.200.200.135/32"]
  }

  egress {
    protocol	= -1
    from_port	= 0
    to_port	= 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "aws" {
  key_name   = "aws"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDFDwxZiNZ4RufZHDn9UyHI+928q5RhRPj0REkaF9Pqut22YKHaU2svpTG2K7Aj9N0iCIpM4ZB58gNYZAsvF7SF6Ytb6G25BKzlIlGneVSpxUZKMop1tONtE7rfxftL5gT8asklpADtXuveL/VHr9jS6EpjQcgBgYbGklwzJci4+glB6jiVXs/bF/BW3XOvhXnEGoa7tW7XpBIRu2Vn3OpzrzEFBXoeWdYTLTooofjgV8CX1F8kvuJq3oeOyjhOH8iRxOH+m6quYBBFbhLHZMboPOHZvsT/xOwFyznK1G+n+HuuCLP4f6iQSSBs1kpNStJDBXPObuVehyqhnjhUttLx dsmith@Dons-iMac.local"
}

resource "aws_instance" "bastion" {
  ami	        	 	= "ami-0014eb7a3248c9cc7"
  instance_type		 	= "t2.micro"
  associate_public_ip_address 	= true
  vpc_security_group_ids	= ["${aws_security_group.bastion-sg.id}"]
  subnet_id			= aws_subnet.west-2a.id
  key_name			= aws_key_pair.aws.id

  tags = {
    Name = "Bastion"
  }
}
