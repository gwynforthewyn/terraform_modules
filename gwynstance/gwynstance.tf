resource "aws_security_group" "mediate_gwynstance_access" {
  vpc_id = aws_vpc.mystique.id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "mediate_access"
  }
}

resource aws_security_group_rule "allow_ssh" {
  type = "ingress"

  from_port = 22
  to_port = 22

  protocol = "tcp"

  cidr_blocks = ["${var.home_cidr}"]
  
  security_group_id = aws_security_group.mediate_gwynstance_access.id
}

resource aws_security_group_rule "allow_all_egress" {
  type = "egress"

  from_port = 0
  to_port = 0

  protocol = "-1"

  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.mediate_gwynstance_access.id
}


resource "aws_ebs_volume" "external_drive" {
  availability_zone =  aws_subnet.mystic.availability_zone
  size              = 20

  tags = {
    Name = "external_drive"
  }
}

resource "aws_volume_attachment" "mount_external_drive" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.external_drive.id
  instance_id = aws_instance.gwynstance.id
}

resource "aws_instance" "gwynstance" {
  ami = "ami-089fe97bc00bff7cc" #debian

  associate_public_ip_address = true
  key_name = aws_key_pair.access_aws.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.mediate_gwynstance_access.id]
  subnet_id = aws_subnet.mystic.id

  tags = {
    Name = var.short_host_name
  }
}

resource "aws_route53_record" "gwynstance" {
  zone_id = data.aws_route53_zone.toplevel.zone_id
  name    = var.dns_hostname
  type    = "A"
  ttl     = "1"
  records = [aws_instance.gwynstance.public_ip]
}
