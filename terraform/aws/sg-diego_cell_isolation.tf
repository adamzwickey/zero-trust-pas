resource "aws_security_group" "pcf-diego-cell-iso" {
    name = "pcf_diego_cell_iso_security_group"
    description = "SG for Iso Segment Cell PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_diego_cell_iso_security_group"
    }
}

resource "aws_security_group_rule" "allow_cell_iso_egress_loggregator" {
    description = "Outbound Loggregator Access"
    type = "egress"
    from_port = 8080
    to_port = 8088
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-diego-cell-iso.id}"
    source_security_group_id = "${aws_security_group.pcf-loggregator.id}"
}
