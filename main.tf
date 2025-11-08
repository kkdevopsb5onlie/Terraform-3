# main.tf

provider "aws" {
  region = "ap-south-1" # Mumbai region (change if needed)
}

# Create a Key Pair (optional)
resource "aws_key_pair" "mykey" {
  key_name   = "mykey"
  public_key = file("~/.ssh/id_rsa.pub") # path to your public key
}

# Create a Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-security-group"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 Instance
resource "aws_instance" "myec2" {
  ami           = "ami-0dee22c13ea7a9a67" # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  security_groups = [aws_security_group.ec2_sg.name]

  tags = {
    Name = "MyTerraformEC2"
  }
}
