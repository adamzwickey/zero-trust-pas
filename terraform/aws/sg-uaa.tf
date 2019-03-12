resource "aws_security_group" "pcf-uaa" {
    name = "pcf_uaa_security_group"
    description = "SG for UAA PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_uaa_security_group"
    }
}

resource "aws_security_group_rule" "allow_diego_ingress_uaa" {
    description = "Inbound Diego Access"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}
