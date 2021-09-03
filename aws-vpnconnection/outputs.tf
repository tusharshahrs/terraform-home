output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The vpc id"
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "vgw_gateway_id" {
  description = "Description: The ID of the VPN Gateway"
  value       = aws_vpn_gateway.vpngateway.id
}

output "customergateway_id" {
  description = "The amazon-assigned ID of the customer gateway."
  value       = aws_customer_gateway.customergateway.id
}

output "vpn_connection_id" {
  description = "The amazon-assigned ID of the VPN connection."
  value       = aws_vpn_connection.vpnconnection.id
}