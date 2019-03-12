resource "aws_security_group" "pcf-nats" {
    name = "pcf_nats_security_group"
    description = "SG for Nats PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_nats_security_group"
    }

}
