/*
  Default Security Group
*/
resource "aws_security_group" "pcf-default" {
    name = "pcf_default_security_group"
    description = "No-Op SG for PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_default_security_group"
    }

    #By default BOSH DNS is open between all instances
    ingress {
        description = "Inbound BOSH DNS"
        from_port = 8853
        to_port = 8853
        protocol = "tcp"
        self = true
    }

    egress {
        description = "Outbound BOSH DNS"
        from_port = 8853
        to_port = 8853
        protocol = "tcp"
        self = true
    }

    egress {
        description = "Outbound AWS NTP"
        from_port = 123
        to_port = 123
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Outbound BOSH NATS"
        from_port = 4222
        to_port = 4222
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }

    ingress {
        description = "Inbound BOSH NATS"
        from_port = 4222
        to_port = 4222
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }

    egress {
        description = "Outbound BOSH Agent"
        from_port = 6868
        to_port = 6868
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }

    egress {
        description = "Outbound BOSH Registry"
        from_port = 25777
        to_port = 25777
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }

    egress {
        description = "Outbound Access AWS S3 Resources"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        prefix_list_ids = ["${var.aws_s3_endpoint_sg}"]
    }

    ingress {
        description = "Inbound BOSH SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = ["${aws_security_group.pcf-bosh.id}"]
    }
}
