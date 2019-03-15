resource "aws_security_group" "pcf-tile-odb" {
    name = "pcf_tile_odb_security_group"
    description = "SG for PCF odb Tile"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_tile_odb_security_group"
    }
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_cc" {
    description = "Inbound CC Access"
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-odb.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_egress_loggregator" {
    description = "Outbound Loggregator Access"
    type = "egress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-odb.id}"
    source_security_group_id = "${aws_security_group.pcf-loggregator.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_egress_pas_api1" {
    description = "Outbound PAS API Access"
    type = "egress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-odb.id}"
    cidr_blocks = "${var.pas_nlb_cidr_blocks}"
}

resource "aws_security_group_rule" "allow_tile_odb_egress_pas_api" {
    description = "Outbound PAS API Access"
    type = "egress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-odb.id}"
    cidr_blocks = "${var.pas_nlb_cidr_blocks}"
}

resource "aws_security_group_rule" "allow_tile_odb_egress_nats" {
    description = "Outbound NATS Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-odb.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_egress_bosh_metrics" {
    description = "Outbound BOSH Metrics Server Access"
    type = "egress"
    from_port = 25555
    to_port = 25555
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-odb.id}"
    source_security_group_id = "${aws_security_group.pcf-bosh.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_egress_bosh_metrics1" {
    description = "Outbound BOSH Metrics Server Access"
    type = "egress"
    from_port = 25595
    to_port = 25595
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-odb.id}"
    source_security_group_id = "${aws_security_group.pcf-bosh.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_egress_bosh_metrics2" {
    description = "Outbound BOSH Metrics Server Access"
    type = "egress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-odb.id}"
    source_security_group_id = "${aws_security_group.pcf-bosh.id}"
}
