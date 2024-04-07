module "region_one" {
    source = "../modules/region1" 
    regionR1 = "us-east-1"
    vpc_cidrR1 =  "10.0.0.0/16"
    PublicSubnet1_cidrR1 = "10.0.0.0/24"
    PublicSubnet2_cidrR1 = "10.0.1.0/24"
    PrivateSubnet1_cidrR1 = "10.0.2.0/24"
    PrivateSubnet2_cidrR1 = "10.0.4.0/24"
    MyPublicIpR1 = "156.194.27.105/32"
}

module "region_two" {
    source = "../modules/region2" 
    regionR2 = "us-east-2"
    vpc_cidrR2 =  "20.0.0.0/16"
    PublicSubnet1_cidrR2 = "20.0.0.0/24"
    PublicSubnet2_cidrR2= "20.0.1.0/24"
    PrivateSubnet1_cidrR2 = "20.0.2.0/24"
    PrivateSubnet2_cidrR2 = "20.0.4.0/24"
    MyPublicIpR2 = "156.194.27.105/32"
}
resource "aws_vpc_peering_connection" "myPeeringConnection" {
  peer_vpc_id   = module.region_two.DestinationVpcID         #destination vpc 
  vpc_id        = module.region_one.SourceVpcID              #source vpc 
  peer_region   = "us-east-2"                             #destination region 
}





























