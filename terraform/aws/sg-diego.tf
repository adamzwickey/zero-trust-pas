resource "aws_security_group" "pcf-diego" {
    name = "pcf_diego_security_group"
    description = "SG for Diego PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_diego_security_group"
    }

}
