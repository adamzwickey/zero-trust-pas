resource "aws_security_group" "pcf-router" {
    name = "pcf_router_security_group"
    description = "SG for Router PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_router_security_group"
    }

}
