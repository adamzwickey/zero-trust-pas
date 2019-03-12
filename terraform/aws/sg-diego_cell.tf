resource "aws_security_group" "pcf-diego-cell" {
    name = "pcf_diego_cell_security_group"
    description = "SG for Diego Cell PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_diego_cell_security_group"
    }

}
