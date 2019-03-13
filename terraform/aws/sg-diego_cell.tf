resource "aws_security_group" "pcf-diego-cell" {
    name = "pcf_diego_cell_security_group"
    description = "SG for Diego Cell PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_diego_cell_security_group"
    }
}

resource "aws_security_group_rule" "allow_diego_cell_egress_diego_db" {
    description = "Outbound Diego DB Access"
    type = "egress"
    from_port = 4003
    to_port = 4003
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-diego.id}"
}

resource "aws_security_group_rule" "allow_diego_cell_egress_credhub" {
    description = "Outbound Credhub Access"
    type = "egress"
    from_port = 8844
    to_port = 8844
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-credhub.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_loggregator" {
    description = "Outbound Loggregator Access"
    type = "egress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-loggregator.id}"
}

resource "aws_security_group_rule" "allow_cell_egress_nats" {
    description = "Outbound NATs Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell.id}"
    source_security_group_id = "${aws_security_group.pcf-nats.id}"
}
