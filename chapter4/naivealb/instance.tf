### Instance


data "aws_ami" "amazon-linux-2" {
  most_recent = true

  filter {
    name = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name = "name"
    values = ["amzn2-ami-*-x86_64-gp2"]
  }
}

resource "aws_instance" "app" {
  subnet_id = "${element(aws_subnet.main.*.id, 1)}"
  vpc_security_group_ids = [
    "${aws_security_group.instance-sg.id}",
  ]

  key_name                    = "first"
  ami                         = "${data.aws_ami.amazon-linux-2.id}"
  instance_type               = "t2.micro"
  user_data                   = "${file("userdatascript.sh")}"
  

  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
}
