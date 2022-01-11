
variable "vpc_cidr" {
  type = string
  # The cidr used to initialise our VPC.
  default = "10.0.0.0/20"
}

variable "subnet_az" {
  type = string
  default = "us-east-2a"
}

variable "mystic_subnet_cidr" {
  type = string
  #10.0.0.0 - 10.0.0.63
  default = "10.0.0.0/26"
}

variable "home_cidr" {
  type = string
  # Home public address.
  default = "67.176.80.56/32"
}

variable "dns_hostname" {
  type = string
  description = "The public hostname for your gwynstance"
}

variable "short_host_name" {
  type = string
  description = "Entered into the name tag for the gwynstance"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "EC2 instance type to request"
}