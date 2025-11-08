# AWS Region
variable "aws_region" {
  description = "AWS region where EC2 will be created"
  type        = string
  default     = "ap-south-1"
}

# Instance Type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# AMI ID
variable "ami_id" {
  description = "Amazon Machine Image ID for EC2 instance"
  type        = string
  default     = "ami-0dee22c13ea7a9a67" # Example for ap-south-1 (Mumbai)
}

# Key Pair Name
variable "key_name" {
  description = "Name of the existing AWS key pair to access EC2"
  type        = string
  default     = "mykey"
}

# Allowed SSH CIDR
variable "ssh_cidr" {
  description = "CIDR block allowed to connect via SSH"
  type        = string
  default     = "0.0.0.0/0"
}
