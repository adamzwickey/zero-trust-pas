resource "aws_security_group" "pcf-diego" {
    name = "pcf_diego_security_group"
    description = "SG for Diego PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_diego_security_group"
    }
}

resource "aws_security_group_rule" "allow_diego_egress_rds" {
    description = "Outbound RDS Access"
    type = "egress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-rds.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_cc" {
    description = "Outbound CC Access"
    type = "egress"
    from_port = 9022
    to_port = 9022
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_uaa" {
    description = "Outbound UAA Access"
    type = "egress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_cell" {
    description = "Inbound Diego Cell Access"
    type = "ingress"
    from_port = 4003
    to_port = 4003
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_diego_egress_nats" {
    description = "Outbound CF NATS Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}

resource "aws_security_group_rule" "allow_diego_ingress_cc" {
    description = "Inbound Diego Cell Access"
    type = "ingress"
    from_port = 8889
    to_port = 8889
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_diego_locket_ingress_cc" {
    description = "Inbound Diego Cell Locket Access"
    type = "ingress"
    from_port = 8891
    to_port = 8891
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}
