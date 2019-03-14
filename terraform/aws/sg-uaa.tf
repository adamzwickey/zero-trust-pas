resource "aws_security_group" "pcf-uaa" {
    name = "pcf_uaa_security_group"
    description = "SG for UAA PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_uaa_security_group"
    }
}

resource "aws_security_group_rule" "allow_uaa_ingress_diego" {
    description = "Inbound Diego Access"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_uaa_egress_rds" {
    description = "Outbound RDS Access"
    type = "egress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-rds.id}"
}

resource "aws_security_group_rule" "allow_uaa_egress_nats" {
    description = "Outbound RDS Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}

resource "aws_security_group_rule" "allow_uaa_ingress_cc" {
    description = "Inbound CC Access"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_uaa_ingress_credhub" {
    description = "Inbound Credhub Access"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-credhub.id}"
}

resource "aws_security_group_rule" "allow_uaa_ingress_loggregator" {
    description = "Inbound Loggregator Access"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-loggregator.id}"
}

resource "aws_security_group_rule" "allow_uaa_egress_loggregator" {
    description = "Outbound Loggregator Access"
    type = "egress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-loggregator.id}"
}

resource "aws_security_group_rule" "allow_uaa_ingress_cell" {
    description = "Inbound Diego Cell Access"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_uaa_ingress_celliso" {
    description = "Inbound Diego Cell Access"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_uaa_ingress_router" {
    description = "Inbound Router Access"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-router.id}"
}

resource "aws_security_group_rule" "allow_uaa_ingress_router1" {
    description = "Inbound Router Access"
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-uaa.id}"
    source_security_group_id = "${aws_security_group.pcf-router.id}"
}
