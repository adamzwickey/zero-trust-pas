resource "aws_security_group" "pcf-bbr" {
    name = "pcf_bbr_security_group"
    description = "SG for BBR PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_bbr_security_group"
    }
}

resource "aws_security_group_rule" "allow_bbr_egress_loggregator" {
    description = "Outbound Loggregator Access"
    type = "egress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bbr.id}"
    source_security_group_id = "${aws_security_group.pcf-loggregator.id}"
}
