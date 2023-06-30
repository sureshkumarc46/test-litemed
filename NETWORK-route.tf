/* Routing table for public subnet */
resource "aws_route_table" "public1" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name        = "${var.environment}-public-route-table"
    env = "${var.environment}"
  }
}

resource "aws_route" "public_internet_gateway1" {
  route_table_id         = "${aws_route_table.public1.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.ig.id}"
}

/* Route table associations */
resource "aws_route_table_association" "public1" {
  count          = "${length(var.public_subnets_cidr1)}"
  subnet_id      = "${element(aws_subnet.public_subnet1.*.id, count.index)}"
  route_table_id = "${aws_route_table.public1.id}"
}

/* Routing table for public subnet */
resource "aws_route_table" "public2" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags = {
    Name        = "${var.environment}-public-route-table2"
    env = "${var.environment}"
  }
}

resource "aws_route" "public_internet_gateway2" {
  route_table_id         = "${aws_route_table.public2.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.ig.id}"
}

/* Route table associations */
resource "aws_route_table_association" "public" {
  count          = "${length(var.public_subnets_cidr2)}"
  subnet_id      = "${element(aws_subnet.public_subnet2.*.id, count.index)}"
  route_table_id = "${aws_route_table.public2.id}"
}