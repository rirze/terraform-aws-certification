## naive ALB

resource "aws_alb_target_group" "test" {
  name     = "tf-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.main.id}"
}

resource "aws_alb" "main" {
  name            = "tf-apache-alb"
  subnets         = ["${aws_subnet.main.*.id}"]
  security_groups = ["${aws_security_group.lb-sg.id}"]
}

resource "aws_alb_listener" "front_end" {
  load_balancer_arn = "${aws_alb.main.id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.test.id}"
    type             = "forward"
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = "${aws_alb_target_group.test.arn}"
  target_id        = "${aws_instance.app.id}"
  port             = 80
}
