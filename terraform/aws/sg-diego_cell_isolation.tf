resource "aws_security_group" "pcf-diego-cell-iso" {
    name = "pcf_diego_cell_iso_security_group"
    description = "SG for Iso Segment Cell PCF Instances"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_diego_cell_iso_security_group"
    }

}
