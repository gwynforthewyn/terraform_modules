output "gwynstance_public_hostname" {
  value = aws_route53_record.gwynstance.name
}

output "reminder_message" {
  value = "update your ansible hosts file while you wait for dns to update"
}

output "gwynstance_public_address" {
  value = aws_instance.gwynstance.public_ip
}

output "gwynstance_type" {
  value = aws_instance.gwynstance.instance_type
}

output "gwynstance_security_group" {
  value = aws_security_group.mediate_gwynstance_access
}
