resource "aws_vpc" "OADA_VPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "OADA_VPC"
  }
}
resource "aws_subnet" "OADA_Subnet" {
  cidr_block = "${cidrsubnet(aws_vpc.OADA_VPC.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.OADA_VPC.id}"
  availability_zone = "${var.availability_zone}"
}

resource "aws_internet_gateway" "OADA_gw" {
  vpc_id = "${aws_vpc.OADA_VPC.id}"
tags {
    Name = "OADA_GW"
  }
}
resource "aws_route_table" "OADA_route_table" {
  vpc_id = "${aws_vpc.OADA_VPC.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.OADA_gw.id}"
  }
tags {
    Name = "OADA_route_table"
  }
}
resource "aws_route_table_association" "OADA_subnet_association" {
  subnet_id      = "${aws_subnet.OADA_Subnet.id}"
  route_table_id = "${aws_route_table.OADA_route_table.id}"
}
resource "aws_eip" "OADA_IP" {
  instance = "${aws_instance.oada_server.id}"
  vpc      = true
}