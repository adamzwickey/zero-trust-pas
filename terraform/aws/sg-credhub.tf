resource "aws_security_group" "pcf-credhub" {
    name = "pcf_credhub_security_group"
    description = "SG for Credhub PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_credhub_security_group"
    }

}
