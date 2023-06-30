/* Public subnet */
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnets_cidr1}"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-litemed-public-subnet1"
    env = "${var.environment}"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.public_subnets_cidr2}"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-litemed-public-subnet2"
    env = "${var.environment}"
  }
}