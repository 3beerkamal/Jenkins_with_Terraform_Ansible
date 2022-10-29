resource "aws_vpc" "iti" {
  cidr_block = var.vpc-cidr

  tags = {
    Name = var.vpc-name
  }
}