resource "aws_security_group" "pcf-cc" {
    name = "pcf_cc_security_group"
    description = "SG for Cloud Controller PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_cc_security_group"
    }
}

resource "aws_security_group_rule" "allow_cc_ingress_diego" {
    description = "Inbound Diego Access"
    type = "ingress"
    from_port = 9022
    to_port = 9022
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-cc.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}
