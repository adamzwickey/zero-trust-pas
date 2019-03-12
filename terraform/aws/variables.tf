#Basic Stuff for AWS
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
variable "aws_vpc" {}
#Used for whitelisting AWS Resources
variable "aws_ec2_endpoint_sg" {}
variable "aws_elb_endpoint_sg" {}
variable "aws_s3_endpoint_sg" {}

#Other PCF Stuff
variable "env_name" {}

#Ops Manager
variable "om_ingress_cidr" {}
variable "om_egress" {}
