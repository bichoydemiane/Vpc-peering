output "DestinationVpcID" {
  value = aws_vpc.CustomVpcR2.id
}

output "CustomerPublicRouteTableR2_output" {
  value = aws_route_table.CustomerPublicRouteTableR2.id
}