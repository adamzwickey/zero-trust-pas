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
}