env_name               = "pcf"
aws_access_key         = "my-key"
aws_secret_key         = "my-secret"
aws_region             = "us-east-1"
aws_vpc                = "vpc-my-id"
aws_ec2_endpoint_sg    = "sg-my-endpoint-sg-id"
aws_elb_endpoint_sg    = "sg-my-endpoint-sg-id"
aws_s3_endpoint_sg     = "pl-my-s3-gateway-pl"

internal_cidr          = "10.0.0.0/16"

om_ingress_cidr        = "0.0.0.0/0"
om_egress              = 1

cells_allow_all_internal = 1

router_ingress_cidr = "0.0.0.0/0"
router_allow_http = 1
pas_nlb_cidr_blocks = ["18.209.194.175/32","3.208.189.2/32","3.94.219.27/32"]
