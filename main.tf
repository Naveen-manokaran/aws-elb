resource "aws_elb" "bar" {
  name                       = var.elb_name
  availability_zones         = var.availability_zones
  enable_deletion_protection = true
  access_logs {
    bucket  = aws_s3_bucket.this.bucket
    prefix  = var.name
    enabled = true
  }
  listener {
    instance_port     = var.instance_port
    instance_protocol = var.instance_protocol
    lb_port           = var.lb_port
    lb_protocol       = var.lb_protocol
  }

  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    target              = var.target
    interval            = var.interval
  }

  #instances                  = [aws_instance.foo.id]
  cross_zone_load_balancing   = var.cross_zone_load_balancing
  idle_timeout                = var.idle_timeout
  connection_draining         = var.connection_draining
  connection_draining_timeout = var.connection_draining_timeout

  tags = {
    Name = var.tags
  }
}


resource "aws_s3_bucket" "this" {
  bucket        = var.bucket_name
  acl           = var.acl
  force_destroy = var.force_destroy

}






































# resource "aws_lb" "test" {
#   name               = "test-lb-tf"
#   internal           = false
#   load_balancer_type = ""
#   security_groups    = [aws_security_group.ssh_from_office.id]
#   subnets            = [aws_subnet.my-pub_subnet.id,aws_subnet.my-pri_subnet.id]

#   enable_deletion_protection = true
#   tags = {
#     Environment = "production"
#   }
# }
# resource "aws_lb_target_group" "example2" {
#   name     = "example"
#   port     = 6081
#   protocol = "GENEVE"
#   vpc_id   = aws_vpc.my-vpc.id

#   health_check {
#     port     = 80
#     protocol = "HTTP"
#   }
# }

# resource "aws_lb_listener" "example1" {
#   load_balancer_arn = aws_lb.test.id
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     target_group_arn = aws_lb_target_group.example2.id
#     type             = "forward"
#   }
# }

# resource "aws_alb_listener_rule" "listener_rule" {
#   #depends_on   = ["aws_alb_target_group.example"]  
#   listener_arn = "${aws_alb_listener.example1.arn}"  
#   priority     = 99  
#   action {    
#     type             = "forward"    
#     target_group_arn = "${aws_alb_target_group.example2.id}"  
#   }   
#   condition {    
#     field  = "path-pattern"    
#     values = ["my-service.*.terraform.io"]  
#   }
# }

































# resource "aws_subnet" "my-pub_subnet" {
#   vpc_id = "${aws_vpc.my-vpc.id}"
#   cidr_block = "10.0.1.0/24"
#   availability_zone = "us-east-2a"
# }
# resource "aws_subnet" "my-pri_subnet" {
#   vpc_id = "${aws_vpc.my-vpc.id}"
#   cidr_block = "10.0.2.0/25"
#   availability_zone = "us-east-2b"
# }

# resource "aws_vpc" "my-vpc" {
#   cidr_block = "10.0.0.0/16"

# }
# resource "aws_security_group" "ssh_from_office" {
#   name = "ssh_from_office"
#   description = "Allow ssh from office"
#   vpc_id = "${aws_vpc.my-vpc.id}"

#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port = 443
#     to_port = 443
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] 
#   }

#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }