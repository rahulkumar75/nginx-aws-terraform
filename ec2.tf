resource "aws_instance" "nginxServer" {
  ami                    = "ami-08bf489a05e916bbd"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public-tf-subnet.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
                #!/bin/bash
                sudo yum install nginx -y
                sudo systemctl start nginx
                sudo systemctl enable nginx
                EOF

  tags = {
    Name = "nginxServer"
  }
}
