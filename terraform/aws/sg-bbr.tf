resource "aws_security_group" "pcf-bbr" {
    name = "pcf_bbr_security_group"
    description = "SG for BBR PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_bbr_security_group"
    }

}
