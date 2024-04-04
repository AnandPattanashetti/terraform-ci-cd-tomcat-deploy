resource "aws_instance" "web2" {
ami                    = "ami-0eba6c58b7918d3a1"
instance_type          = "t2.micro"
key_name               = "Jenkins"
vpc_security_group_ids = [aws_security_group.tomcat_sg.id]
user_data              = templatefile("./Tomcat.sh", {})
tags = {
Name = "Tomcat"
}
root_block_device {
volume_size = 30
}
}
resource "aws_security_group" "tomcat_sg" {
name        = "tomcat_sg"
description = "Allow TLS inbound traffic"
ingress = [
for port in [22,8080] : {
      description      = "inbound rules"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "tomcat_sg"
  }
}
