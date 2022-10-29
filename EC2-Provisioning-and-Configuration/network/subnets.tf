resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.public1-subnet-cidr
  map_public_ip_on_launch = true
  availability_zone = var.az1
  tags = {
    Name = "public-subnet1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.iti.id
  cidr_block = var.public2-subnet-cidr
  map_public_ip_on_launch = true
  availability_zone = var.az2
  tags = {
    Name = "public-subnet2"
  }
}