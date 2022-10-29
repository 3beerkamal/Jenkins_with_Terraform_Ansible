resource "aws_route_table" "public" {
  vpc_id = aws_vpc.iti.id

  tags = {
    Name = "Public-route-table"
  }
}

resource "aws_route" "public-route" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.iti.id
  depends_on                = [aws_route_table.public]
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}