resource "aws_subnet" "west-2a" {
  vpc_id 		= aws_vpc.lab.id
  cidr_block 		= "10.0.0.0/18"
  availability_zone	= "us-west-2a"

  tags = {
    Name = "lab-us-west-2a"
  }
}

resource "aws_subnet" "west-2b" {
  vpc_id 		= aws_vpc.lab.id
  cidr_block 		= "10.0.64.0/18"
  availability_zone	= "us-west-2b"

  tags = {
    Name = "lab-us-west-2b"
  }
}

resource "aws_subnet" "west-2c" {
  vpc_id 		= aws_vpc.lab.id
  cidr_block 		= "10.0.128.0/18"
  availability_zone	= "us-west-2c"

  tags = {
    Name = "lab-us-west-2c"
  }
}

resource "aws_subnet" "west-2d" {
  vpc_id 		= aws_vpc.lab.id
  cidr_block 		= "10.0.192.0/18"
  availability_zone	= "us-west-2d"

  tags = {
    Name = "lab-us-west-2d"
  }
}
