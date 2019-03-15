/*
  Default Security Group
*/
resource "aws_security_group" "pcf-bootstrap" {
    name = "pcf_bootstrap_security_group"
    description = "Bootstrap SG for PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_bootstrap_security_group"
    }


    ingress {
        description = "Inbound All Internal"
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["${var.internal_cidr}"]
    }

    egress {
        description = "Outbound All Internal"
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["${var.internal_cidr}"]
    }

    egress {
        description = "Outbound AWS NTP"
        from_port = 123
        to_port = 123
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "Outbound Access AWS S3 Resources"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        prefix_list_ids = ["${var.aws_s3_endpoint_sg}"]
    }

    /*
      Default Security Group
    */
    egress {
        description = "Temp Access to Dynatrace"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["52.5.76.57/32","52.4.169.68/32","54.77.175.7/32","52.214.31.22/32"]
    }
}
