resource "aws_security_group" "pcf-loggregator" {
    name = "pcf_loggregator_security_group"
    description = "SG for Loggregator PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_loggregator_security_group"
    }

}
