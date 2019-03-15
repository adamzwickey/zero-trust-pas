resource "aws_security_group" "pcf-tile-rmq" {
    name = "pcf_tile_rmq_security_group"
    description = "SG for PCF rmq Tile"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_tile_rmq_security_group"
    }
}

resource "aws_security_group_rule" "allow_tile_rmq_egress_credhub" {
    description = "Outbound Credhub Access"
    type = "egress"
    from_port = 8844
    to_port = 8844
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    source_security_group_id = "${aws_security_group.pcf-bosh.id}"
}


resource "aws_security_group_rule" "allow_tile_rmq_egress_epmd" {
    description = "Outbound Rabbit Internal Access"
    type = "egress"
    from_port = 4369
    to_port = 4369
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_ingress_epmd" {
    description = "Inbound Rabbit Internal Access"
    type = "ingress"
    from_port = 4369
    to_port = 4369
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_egress_int" {
    description = "Outbound Rabbit Internal Access"
    type = "egress"
    from_port = 25672
    to_port = 25672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_ingress_int" {
    description = "Inbound Rabbit Internal Access"
    type = "ingress"
    from_port = 25672
    to_port = 25672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_egress_http" {
    description = "Outbound Rabbit Internal Access"
    type = "egress"
    from_port = 15672
    to_port = 15672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_ingress_http" {
    description = "Inbound Rabbit Internal Access"
    type = "ingress"
    from_port = 15672
    to_port = 15672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_router" {
    description = "Inbound Router Access"
    type = "ingress"
    from_port = 15672
    to_port = 15672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    source_security_group_id = "${aws_security_group.pcf-router.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_router1" {
    description = "Inbound Router Access to ODB"
    type = "ingress"
    from_port = 4567
    to_port = 4567
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    source_security_group_id = "${aws_security_group.pcf-router.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_router2" {
    description = "Inbound Router Access"
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    source_security_group_id = "${aws_security_group.pcf-router.id}"
}
