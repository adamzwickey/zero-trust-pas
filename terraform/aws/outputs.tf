output "iaas" {
  value = "aws"
}

output "OM Security Group" {
  value = "${aws_security_group.pcf-opsman.id}"
}
