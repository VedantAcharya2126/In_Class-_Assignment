data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#creating app node

resource "aws_instance" "web" {
  #count = 2
  count         = var.create_ec2 ? var.counter : 0
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [var.sg]
  # security_groups = [var.sg]
  tags = {
    Name = "Demo Project"
  }
}
