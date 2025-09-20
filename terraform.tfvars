vpc_name_tag ="twc_vpc"
cidr_vpc = "10.0.0.0/16"
igw_name_tag = "twc_igw"
cidr_block_pb1 = "10.0.1.0/24"
cidr_block_pb2 = "10.0.2.0/24"
cidr_block_pr1 = "10.0.3.0/24"
cidr_block_pr2 = "10.0.4.0/24"
private_sb_tag1 = "twc_pr1"
private_rt_tag = "twc_pr2"
private_sb_tag2 ="twc_pb2"
public_tag_1 = "twc_ps1"
public_tag_2 = "twc_ps2"
public_rt_tag = "twc_routetable"
destination_cidr_block = "0.0.0.0/0"     
cidr_block_security = "0.0.0.0/0"
security_group_tag = "twc_sg"
map_public_ip_on_launch = null
availability_zone ="ap-south-1a"


################ec2###############
ami_name ="ami-01b6d88af12965bb6"
instance_type="t2.small"
env_prefix ="dev"






