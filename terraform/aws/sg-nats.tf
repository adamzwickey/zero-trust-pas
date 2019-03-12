resource "aws_security_group" "pcf-nats" {
    name = "pcf_nats_security_group"
    description = "SG for Nats PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_nats_security_group"
    }
}

resource "aws_security_group_rule" "allow_nats_ingress_diego_database" {
    description = "Inbound Diego NATS Access"
    type = "ingress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-nats.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_nats_ingress_uaa" {
    description = "Inbound UAA NATS Access"
    type = "ingress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-nats.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_nats_ingress_cc" {
    description = "Inbound CC NATS Access"
    type = "ingress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-nats.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}
