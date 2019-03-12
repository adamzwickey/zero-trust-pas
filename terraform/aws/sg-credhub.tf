resource "aws_security_group" "pcf-credhub" {
    name = "pcf_credhub_security_group"
    description = "SG for Credhub PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_credhub_security_group"
    }
}

resource "aws_security_group_rule" "allow_credhub_egress_rds" {
    description = "Outbound RDS Access"
    type = "egress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-credhub.id}"
    source_security_group_id = "${aws_security_group.pcf-rds.id}"
}

resource "aws_security_group_rule" "allow_credhub_egress_uaa" {
    description = "Outbound UAA Access"
    type = "egress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-credhub.id}"
    source_security_group_id = "${aws_security_group.pcf-uaa.id}"
}

resource "aws_security_group_rule" "allow_credhub_ingress_cc" {
    description = "Inbound CC Access"
    type = "ingress"
    from_port = 8844
    to_port = 8844
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-credhub.id}"
    source_security_group_id = "${aws_security_group.pcf-cc.id}"
}

resource "aws_security_group_rule" "allow_credhub_ingress_diego_cell" {
    description = "Inbound Diego Cell Access"
    type = "ingress"
    from_port = 8844
    to_port = 8844
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-credhub.id}"
    source_security_group_id = "${aws_security_group.pcf-diego-cell.id}"
}
