resource "aws_security_group" "custom_sg" {
  name        = "custom-sg"
  description = "Allow inbound on custom port"

  ingress {
    description = "Allow inbound traffic on custom port"
    from_port   = var.custom_port
    to_port     = var.custom_port
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

resource "aws_instance" "ubuntu_instance" {
  ami           = "ami-0dba2cb6798deb6d8"  # Update for your region if needed
  instance_type = "t2.micro"
  security_groups = [aws_security_group.custom_sg.name]

  tags = {
    Name = "UbuntuInstance"
  }
}
