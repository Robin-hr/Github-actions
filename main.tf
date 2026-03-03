data "aws_vpc" "default" {
  default = true
}
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.inatance_type
  key_name = var.key_name
  
  vpc_security_group_ids = [aws_security_group.default_sg.id]
  associate_public_ip_address = true 

   user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Deployed via Terraform + GitHub Actions 🚀</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Github-actions"
  }
}