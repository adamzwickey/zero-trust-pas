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

resource "aws_security_group_rule" "allow_cc_egress_rds" {
    description = "Outbound RDS Access"
    type = "egress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-cc.id}"
    source_security_group_id = "${aws_security_group.pcf-rds.id}"
}

resource "aws_security_group_rule" "allow_cc_egress_nats" {
    description = "Outbound NATS Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-cc.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}

resource "aws_security_group_rule" "allow_cc_egress_uaa" {
    description = "Outbound NATS Access"
    type = "egress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-cc.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_cc_egress_diego_database" {
    description = "Outbound Diego DB Access"
    type = "egress"
    from_port = 8889
    to_port = 8889
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-cc.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_cc_egress_diego_database_locket" {
    description = "Outbound Diego DB Access"
    type = "egress"
    from_port = 8891
    to_port = 8891
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-cc.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}
