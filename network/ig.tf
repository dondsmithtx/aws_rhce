resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.lab.id

  tags = {
    Name = "lab"
  }
}
