resource "aws_instance" "web1" {
  ami                    = "ami-031134f7a79b6e424"
  instance_type          = "t2.micro"
  key_name               = "Jenkins"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  user_data              = templatefile("./Jenkins.sh", {})

  tags = {
    Name = "jenkins"
  }

  root_block_device {
    volume_size = 30
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg_unique"  # Change the name to make it unique
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
    Name = "masterjenkins_sg"
  }
}
