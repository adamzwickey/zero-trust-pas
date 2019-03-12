resource "aws_security_group" "pcf-uaa" {
    name = "pcf_uaa_security_group"
    description = "SG for UAA PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_uaa_security_group"
    }

}
