# Create a VPC
resource "aws_vpc" "my-tf-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-tf-vpc"
  }
}

# Public Subnet
resource "aws_subnet" "public-tf-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.my-tf-vpc.id
  tags = {
    Name = "public-tf-subnet"
  }
}

# Private Subnet
resource "aws_subnet" "private-tf-subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.my-tf-vpc.id
  tags = {
    Name = "private-tf-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "my-tf-igw" {
  vpc_id = aws_vpc.my-tf-vpc.id
  tags = {
    Name = "my-tf-igw"
  }
}

# Routing Table
resource "aws_route_table" "my-tf-rtb" {
  vpc_id = aws_vpc.my-tf-vpc.id
  tags = {
    Name = "my-tf-rtb"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-tf-igw.id
  }
}

# Route Table Association for Public Subnet
resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.my-tf-rtb.id
  subnet_id      = aws_subnet.public-tf-subnet.id
}
