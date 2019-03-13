resource "aws_security_group" "pcf-loggregator" {
    name = "pcf_loggregator_security_group"
    description = "SG for Loggregator PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_loggregator_security_group"
    }
}

resource "aws_security_group_rule" "allow_loggregator_ingress_self" {
    description = "Inbound Loggregator (Self) Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    self = true
}

resource "aws_security_group_rule" "allow_syslogadapter_ingress_self" {
    description = "Inbound Syslog Adapter (Self) Access"
    type = "ingress"
    from_port = 4443
    to_port = 4443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    self = true
}

resource "aws_security_group_rule" "allow_loggregator_ingress_bbr" {
    description = "Inbound Loggregator BBR Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-bbr.id}"
}

resource "aws_security_group_rule" "allow_loggregator_ingress_cc" {
    description = "Inbound Loggregator CC Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_loggregator_ingress_credhub" {
    description = "Inbound Loggregator Credhub Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-credhub.id}"
}

resource "aws_security_group_rule" "allow_loggregator_ingress_diego_cell" {
    description = "Inbound Loggregator Diego Cell Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_loggregator_ingress_diego_cell_iso" {
    description = "Inbound Loggregator Diego Cell Iso Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell-iso.id}"
}

resource "aws_security_group_rule" "allow_loggregator_ingress_diego" {
    description = "Inbound Loggregator Diego Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_loggregator_ingress_nats" {
    description = "Inbound Loggregator NATS Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}

resource "aws_security_group_rule" "allow_loggregator_ingress_router" {
    description = "Inbound Loggregator Router Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-router.id}"
}

resource "aws_security_group_rule" "allow_loggregator_ingress_uaa" {
    description = "Inbound Loggregator UAA Access"
    type = "ingress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_loggregator_egress_nats" {
    description = "Outbound NATS Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}

resource "aws_security_group_rule" "allow_loggregator_egress_uaa" {
    description = "Outbound UAA Access"
    type = "egress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_loggregator_egress_cc" {
    description = "Outbound Cloud Controller Access"
    type = "egress"
    from_port = 9023
    to_port = 9023
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_loggregator_egress_bosh_metrics" {
    description = "Outbound BOSH Metrics Server Access"
    type = "egress"
    from_port = 25555
    to_port = 25555
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-bosh.id}"
}

resource "aws_security_group_rule" "allow_loggregator_egress_bosh_metrics1" {
    description = "Outbound BOSH Metrics Server Access"
    type = "egress"
    from_port = 25595
    to_port = 25595
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-bosh.id}"
}

resource "aws_security_group_rule" "allow_loggregator_egress_bosh_metrics2" {
    description = "Outbound BOSH Metrics Server Access"
    type = "egress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
    source_security_group_id = "${aws_security_group.pcf-bosh.id}"
}

resource "aws_security_group_rule" "allow_loggregator_egress_syslog" {
    description = "Outbound Syslog Adapter Access"
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = "${aws_security_group.pcf-loggregator.id}"
}
