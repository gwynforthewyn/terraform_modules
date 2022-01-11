resource "aws_internet_gateway" "gwyn_innernet" {
  vpc_id = aws_vpc.mystique.id

  tags = {
    Name = "gwyn_innernet"
  }
}


resource "aws_route_table" "neeeeeeded" {
  vpc_id = aws_vpc.mystique.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gwyn_innernet.id
  }

  tags = {
    Name: "mystique_route_table"
  }
}

resource "aws_route_table_association" "stitching" {
  subnet_id = aws_subnet.mystic.id
  route_table_id = aws_route_table.neeeeeeded.id
}
