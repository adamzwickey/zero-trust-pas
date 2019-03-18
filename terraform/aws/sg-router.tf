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

resource "aws_security_group_rule" "allow_router_egress_loggregator" {
    description = "Outbound Loggregator Access"
    type = "egress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-loggregator.id}"
}


resource "aws_security_group_rule" "allow_router_egress_diego_cell" {
    description = "Outbound Diego Cell Container Access"
    type = "egress"
    from_port = 61001
    to_port = 65534
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_router_ingress_external_http" {
    description = "Inbound Diego Cell Container Access"
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    cidr_blocks = ["${var.router_ingress_cidr}"]
    count = "${var.router_allow_http}"
}

resource "aws_security_group_rule" "allow_router_ingress_external_https" {
    description = "Inbound Diego Cell Container Access"
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    cidr_blocks = ["${var.router_ingress_cidr}"]
}

resource "aws_security_group_rule" "allow_router_ingress_external_healthcheck" {
    description = "Inbound LB healthcheck"
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_router_egress_uaa" {
    description = "Outbound UAA Access"
    type = "egress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_router_egress_uaa1" {
    description = "Outbound UAA Access"
    type = "egress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_router_egress_cc" {
    description = "Outbound Cloud Controller Access"
    type = "egress"
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_router_egress_cc_api" {
    description = "Outbound Cloud Controller Access"
    type = "egress"
    from_port = 9024
    to_port = 9024
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_router_egress_diego_network_policy" {
    description = "Outbound Diego Network Policy Server Access"
    type = "egress"
    from_port = 4002
    to_port = 4002
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_router_egress_diego_celliso" {
    description = "Outbound Diego Cell Container Access"
    type = "egress"
    from_port = 61001
    to_port = 65534
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_router_egress_rmq1" {
    description = "Outbound RMQ Server Access"
    type = "egress"
    from_port = 4567
    to_port = 4567
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
}

resource "aws_security_group_rule" "allow_router_egress_rmq2" {
    description = "Outbound RMQ ODB Access"
    type = "egress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
}

resource "aws_security_group_rule" "allow_router_egress_rmq3" {
    description = "Outbound RMQ Server Access"
    type = "egress"
    from_port = 15672
    to_port = 15674
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
}

resource "aws_security_group_rule" "allow_router_egress_rmq4" {
    description = "Outbound RMQ Server Access"
    type = "egress"
    from_port = 5671
    to_port = 5672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
}

resource "aws_security_group_rule" "allow_router_egress_rmq5" {
    description = "Outbound RMQ Server Access"
    type = "egress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-router.id}"
    source_security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
}
