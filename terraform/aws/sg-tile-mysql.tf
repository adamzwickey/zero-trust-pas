resource "aws_security_group" "pcf-tile-mysql" {
    name = "pcf_tile_mysql_security_group"
    description = "SG for PCF MySQL Tile"
    vpc_id = "${var.aws_vpc}"
    tags {
        Name = "${var.env_name}_pcf_tile_mysql_security_group"
    }
}
