output "SourceVpcID" {
  value = aws_vpc.CustomVpcR1.id
}
output "CustomerPublicRouteTableR1_output" {
  value = aws_route_table.CustomerPublicRouteTableR1.id
}