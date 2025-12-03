resource "aws_instance" "frontend" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-02b07aa1827ae3703"]
  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z04751093FJLNWEV5LUJS"
  name    = "dev.frontend"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-02b07aa1827ae3703"]
  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z04751093FJLNWEV5LUJS"
  name    = "dev.mongodb"
  type    = "A"
  ttl     = 300
  records = [aws_instance.frontend.private_ip]
}