### Instance

resource "aws_autoscaling_group" "app" {
  name                 = "tf-test-asg"
  vpc_zone_identifier  = ["${aws_subnet.main.*.id}"]
  min_size             = "2"
  max_size             = "2"
  desired_capacity     = "2"
  launch_configuration = "${aws_launch_configuration.app.name}"
}

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

resource "aws_launch_configuration" "app" {
  security_groups = [
    "${aws_security_group.instance-sg.id}",
  ]

  key_name                    = "first"
  image_id                    = "${data.aws_ami.amazon-linux-2.id}"
  instance_type               = "t2.micro"
  #iam_instance_profile        = "${aws_iam_instance_profile.app.name}"
  user_data                   = "${file("userdatascript.sh")}"
  #associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}

