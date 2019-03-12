/*
  Ops Manager Security groups
*/
resource "aws_security_group" "pcf-opsman" {
    name = "pcf_opsman_security_group"
    description = "Security Group for OpsMan Instance"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_opsman_security_group"
    }
    ingress {
        description = "Inbound OpsMan UI"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["${var.om_ingress_cidr}"]
    }
    ingress {
        description = "Inbound OpsMan UAA"
        from_port = 8443
        to_port = 8443
        protocol = "tcp"
        cidr_blocks = ["${var.om_ingress_cidr}"]
    }
    ingress {
        description = "Inbound OpsMan SSH Access"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.om_ingress_cidr}"]
    }

    egress {
        description = "Outbound Access to Director API"
        from_port = 25555
        to_port = 25555
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }

    egress {
        description = "Outbound Access to Director Credhub"
        from_port = 8844
        to_port = 8844
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }

    egress {
        description = "Outbound Access to Director NATS"
        from_port = 6868
        to_port = 6868
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }

    egress {
        description = "Outbound Access to Director UAA"
        from_port = 8443
        to_port = 8443
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }

    egress {
        description = "Outbound Access to Director SSH and associated VMs"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }

    egress {
        description = "Outbound Access AWS EC2 Resources"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = ["${var.aws_ec2_endpoint_sg}"]
    }

    egress {
        description = "Outbound Access AWS S3 Resources"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        prefix_list_ids = ["${var.aws_s3_endpoint_sg}"]
    }

    egress {
        description = "Outbound Access to RDS"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-rds.id}"]
    }
}

resource "aws_security_group" "pcf-opsman-external-egress" {
    name = "pcf_opsman_ext_security_group"
    description = "Security Group for OpsMan Instance External Access"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_opsman_ext_security_group"
    }
    count = "${var.om_egress}"
    egress {
        description = "Outbound Access for OM"
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}

/*
  BOSH Security groups
*/
resource "aws_security_group" "pcf-bosh" {
    name = "pcf_bosh_security_group"
    description = "Security Group for BOSH Director"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_bosh_security_group"
    }

    egress {
        description = "Outbound Access AWS EC2 Resources"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = ["${var.aws_ec2_endpoint_sg}"]
    }

    egress {
        description = "Outbound Access AWS S3 Resources"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        prefix_list_ids = ["${var.aws_s3_endpoint_sg}"]
    }

    egress {
        description = "Outbound Access AWS ELB Resources"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        security_groups = ["${var.aws_elb_endpoint_sg}"]
    }

    egress {
        description = "Outbound Access to RDS"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-rds.id}"]
    }
}

resource "aws_security_group_rule" "allow_om_ssh_ingress" {
    description = "Inbound OpsMan SSH Access"
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-opsman.id}"
}

resource "aws_security_group_rule" "allow_om_bosh_uaa_ingress" {
    description = "Inbound OpsMan BOSH UAA Access"
    type = "ingress"
    from_port = 8443
    to_port = 8443
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-opsman.id}"
}

resource "aws_security_group_rule" "allow_om_bosh_nats_ingress" {
    description = "Inbound OpsMan BOSH NATS Access"
    type = "ingress"
    from_port = 6868
    to_port = 6868
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-opsman.id}"
}

resource "aws_security_group_rule" "allow_default_bosh_registry_ingress" {
    description = "Inbound Default BOSH Registry Access"
    type = "ingress"
    from_port = 25777
    to_port = 25777
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-default.id}"
}

resource "aws_security_group_rule" "allow_default_bosh_agent_ingress" {
    description = "Inbound Default BOSH NATS Access"
    type = "ingress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-default.id}"
}

resource "aws_security_group_rule" "allow_default_bosh_agent_egress" {
    description = "Outbound Default BOSH NATS Access"
    type = "egress"
    from_port = 4222
    to_port = 4222
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-default.id}"
}

resource "aws_security_group_rule" "allow_default_bosh_nats_ingress" {
    description = "Inbound Default BOSH NATS Access"
    type = "ingress"
    from_port = 6868
    to_port = 6868
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-default.id}"
}

resource "aws_security_group_rule" "allow_om_director_ingress" {
    description = "Inbound OpsMan Director Access"
    type = "ingress"
    from_port = 25555
    to_port = 25555
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-opsman.id}"
}

resource "aws_security_group_rule" "allow_om_director_credhub_ingress" {
    description = "Inbound OpsMan Director Credhub Access"
    type = "ingress"
    from_port = 8844
    to_port = 8844
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-opsman.id}"
}

resource "aws_security_group_rule" "allow_default_bosh_ssh_egress" {
    description = "Outbound Default BOSH SSH Proxy Access"
    type = "egress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_group_id = "${aws_security_group.pcf-bosh.id}"
    source_security_group_id = "${aws_security_group.pcf-default.id}"
}
