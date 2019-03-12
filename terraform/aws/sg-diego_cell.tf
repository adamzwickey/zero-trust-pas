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
