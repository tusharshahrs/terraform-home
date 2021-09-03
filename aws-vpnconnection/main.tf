module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "demo-site2site"
  cidr = "10.0.0.0/23"

  azs             = ["us-east-2a", "us-east-2b", "us-east-2c"]
  private_subnets = ["10.0.1.0/26", "10.0.1.64/26", "10.0.1.128/25"]
  public_subnets  = ["10.0.0.0/25", "10.0.0.128/26", "10.0.0.192/26"]

  default_vpc_enable_dns_hostnames = true
  default_vpc_enable_dns_support   = true

  enable_nat_gateway = true
  enable_vpn_gateway = false
  single_nat_gateway = true

  tags = {
    environment = "dev"
    costcenter  = "1234"
  }

}

// add vpn gateway
resource "aws_vpn_gateway" "vpngateway" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "demo-site2site-vpngateway"
  }
}

// add customer gateway
resource "aws_customer_gateway" "customergateway" {
  bgp_asn    = 65000
  ip_address = "172.83.124.10"
  type       = "ipsec.1"

  tags = {
    Name = "demo-site2site-customergateway"
  }
}

//add vpcn connection
resource "aws_vpn_connection" "vpnconnection" {
  vpn_gateway_id      = aws_vpn_gateway.vpngateway.id
  customer_gateway_id = aws_customer_gateway.customergateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  tags = {
    Name = "demo-site2site-vpnconnection"
  }
}

// add static route
resource "aws_vpn_connection_route" "office" {
  destination_cidr_block = "192.168.10.0/24"
  vpn_connection_id      = aws_vpn_connection.vpnconnection.id
}