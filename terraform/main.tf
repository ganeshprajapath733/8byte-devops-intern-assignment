resource "aws_vpc" "main" {
	cidr_block = "10.0.0.0/16"
	
	tags = {
		Name = "8byte-vpc"
	}
}

resource "aws_subnet" "public" {
	vpc_id = aws_vpc.main.id
	cidr_block = "10.0.1.0/24"
	availability_zone = "${var.aws_region}a"
	map_public_ip_on_launch = true

	tags = {
		Name = "8byte-public-subnet"
	}
}

resource "aws_internet_gateway" "igw" {
	vpc_id = aws_vpc.main.id

	tags = {
		Name = "8byte-igw"
	}
}

resource "aws_route_table" "public" {
	vpc_id = aws_vpc.main.id
	
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.igw.id
	}

	tags = {
		Name = "8byte-public-rt"
	}
}

resource "aws_route_table_association" "public" {
	subnet_id = aws_subnet.public.id
	route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "web_sg" {
  name        = "8byte-web-sg"
  description = "Allow SSH and Node app access"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Node app access"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "8byte-web-sg"
  }
}

resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = "8byte-key"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true


  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              EOF

  tags = {
    Name = "8byte-ec2"
  }
}
