variable "regionR2" {
  type    = string 
  description = "Region added in tfvars"
}
variable "vpc_cidrR2" {
  type    = string 
  description = "It is the VPC cidr block"
}
variable "PublicSubnet1_cidrR2" {
  type    = string 
  description = "It is the cidr block of the first public subnet"
}
variable "PublicSubnet2_cidrR2" {
  type    = string 
  description = "It is the cidr block of the second public subnet"
}
variable "PrivateSubnet1_cidrR2" {
  type    = string 
  description = "It is the cidr block of the first private subnet"
}
variable "PrivateSubnet2_cidrR2" {
  type    = string 
  description = "It is the cidr block of the second private subnet"
}
variable "MyPublicIpR2" {
  type    = string 
  description = "It is my public ip"
}