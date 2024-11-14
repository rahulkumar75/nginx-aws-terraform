output "instance_public_ip" {
    description = "The Public IP Address Of EC2 Instance"
    value = aws_instance.nginxServer.public_ip
}


output "instance_url" {
    description = "The URL to access the Nginx Server"
    value = "http://${aws_instance.nginxServer.public_ip}"
  
}