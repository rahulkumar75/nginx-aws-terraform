resource "aws_security_group" "nginx-sg" {
  vpc_id = aws_vpc.my-tf-vpc.id

  # Inbound rules for HTTP [Incoming Traffic]
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules [Outgoing Response]
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nginx-sg"
  }
}



/*
Note:
    -> from_port = 80 # Listen
    -> cidr_block = ["0.0.0.0/0"] # Sare IPs se Port-80 Par Listen Hoga 
    ------------------------------------------
    -> from_port = 0 # Enable for All Ports
    -> protocol = "-1" # Accessability for all Protocol
    -> cidr_block = ["0.0.0.0/0"] # Enable To all IPs
*/
