data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "ec2" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.aws_ec2_size
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  key_name               = var.key_name
  user_data              = <<-EOF
                            #!/bin/bash
                            sudo yum update -y
                            sudo yum install -y nginx
                            sudo systemctl start nginx
                            sudo systemctl enable nginx
                            EOF

  tags = {
    Name = "Web-Server"
  }

  lifecycle {
    create_before_destroy = true
  }
}