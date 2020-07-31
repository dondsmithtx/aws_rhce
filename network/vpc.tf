resource "aws_vpc" "lab" {
  cidr_block		= "10.0.0.0/16"
  instance_tenancy	= "default"
  enable_dns_support    = "1"
  enable_dns_hostnames  = "1"

  tags = {
    Name = "lab"
  }
}

resource "aws_default_route_table" "r" {
  default_route_table_id = aws_vpc.lab.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
