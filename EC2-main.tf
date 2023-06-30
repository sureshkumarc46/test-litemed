provider "aws" {

  region = var.region
  
  }
 

resource "aws_instance" "webserver" {

  ami = "ami-053b0d53c279acc90"
  #vpc_id = aws_vpc.vpc.id
  subnet_id = aws_subnet.public_subnet1.id
  instance_type = var.instance_type
  key_name = "litemed_staging_key1"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  associate_public_ip_address = true
  user_data = file("EC2-user_data.sh")

tags = {
    Name = "litemed-staging-instance"
    env = "${var.environment}"
  }
}


# Allocate Elastic IP
resource "aws_eip" "example" {
  instance = aws_instance.webserver.id
  vpc      = true

  tags = {
    env = "${var.environment}"
  }
}

# Associate Elastic IP with EC2 instance
resource "aws_eip_association" "example" {
  instance_id   = aws_instance.webserver.id
  allocation_id = aws_eip.example.id
}