variable "region" {
  description = "required region"
}

variable "environment" {
  description = "The Deployment environment"
}

//Networking
variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr1" {
  type        = string
  description = "The CIDR block for the public subnet"
}

variable "public_subnets_cidr2" {
  type        = string
  description = "The CIDR block for the public subnet"
}


variable "availability_zones" {
  description = "availability_zones"
  type = list
  
}

variable "instance_type" {
  description = "instance type for ec2"
  
}