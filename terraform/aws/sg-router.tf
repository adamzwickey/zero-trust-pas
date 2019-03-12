resource "aws_security_group" "pcf-router" {
    name = "pcf_router_security_group"
    description = "SG for Router PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_router_security_group"
    }
}

resource "aws_security_group_rule" "allow_router_egress_nats" {
    description = "Outbound NATS Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}
