resource "aws_security_group" "pcf-cc" {
    name = "pcf_cc_security_group"
    description = "SG for Cloud Controller PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_cc_security_group"
    }

}
