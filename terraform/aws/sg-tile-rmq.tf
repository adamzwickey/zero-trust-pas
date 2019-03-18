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
    to_port = 15674
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_ingress_http" {
    description = "Inbound Rabbit Internal Access"
    type = "ingress"
    from_port = 15672
    to_port = 15674
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_internal" {
    description = "Inbound Internal Access"
    type = "ingress"
    from_port = 5671
    to_port = 5672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_odb_egress_internal" {
    description = "Outbound Internal Access"
    type = "egress"
    from_port = 5671
    to_port = 5672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_router" {
    description = "Inbound Router Access"
    type = "ingress"
    from_port = 15672
    to_port = 15674
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

resource "aws_security_group_rule" "allow_tile_odb_ingress_cell" {
    description = "Inbound Cell Access"
    type = "ingress"
    from_port = 5671
    to_port = 5672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_celliso" {
    description = "Inbound Cell Access"
    type = "ingress"
    from_port = 5671
    to_port = 5672
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_cell1" {
    description = "Inbound Cell Access"
    type = "ingress"
    from_port = 15672
    to_port = 15674
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_celliso1" {
    description = "Inbound Cell Access"
    type = "ingress"
    from_port = 15672
    to_port = 15674
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-celliso.id}"
}

resource "aws_security_group_rule" "allow_tile_odb_ingress_router_https" {
    description = "Inbound Router Access"
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    source_security_group_id = "${aws_security_group.pcf-router.id}"
}

resource "aws_security_group_rule" "allow_tile_rmq_egress_mqtt" {
    description = "Outbound Rabbit Internal Access"
    type = "egress"
    from_port = 1883
    to_port = 1883
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_ingress_mqtt" {
    description = "Outbound Rabbit Internal Access"
    type = "ingress"
    from_port = 1883
    to_port = 1883
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_egress_mqtt1" {
    description = "Outbound Rabbit Internal Access"
    type = "egress"
    from_port = 8883
    to_port = 8883
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_ingress_mqtt1" {
    description = "Outbound Rabbit Internal Access"
    type = "ingress"
    from_port = 8883
    to_port = 8883
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_egress_stomp" {
    description = "Outbound Rabbit Internal Access"
    type = "egress"
    from_port = 61613
    to_port = 61614
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_ingress_stomp" {
    description = "Outbound Rabbit Internal Access"
    type = "ingress"
    from_port = 61613
    to_port = 61614
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_egress_all" {
    description = "Outbound Rabbit Internal Access"
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}

resource "aws_security_group_rule" "allow_tile_rmq_ingress_all" {
    description = "Outbound Rabbit Internal Access"
    type = "ingress"
    from_port = 0
    to_port = 0
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-tile-rmq.id}"
    self = true
}
