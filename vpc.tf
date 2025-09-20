resource "aws_vpc" "myVPC" {
    cidr_block = var.cidr_vpc

    tags = {
      Name=var.vpc_name_tag
    }
}

############internetageway ##############################
resource "aws_internet_gateway" "myIGW" {
    vpc_id = aws_vpc.myVPC.id
    
    tags={
        Name=var.igw_name_tag
    }
  
}

############################public subnet##########################
resource"aws_subnet" "public_subnet_1"{
    vpc_id = aws_vpc.myVPC.id
    cidr_block = var.cidr_block_pb1
    map_public_ip_on_launch = var.map_public_ip_on_launch
    availability_zone = "ap-south-1a"
    tags={
        Name=var.public_tag_1
    }
}
resource"aws_subnet" "public_subnet_2"{
    vpc_id = aws_vpc.myVPC.id
    cidr_block = var.cidr_block_pb2
    map_public_ip_on_launch = var.map_public_ip_on_launch
    availability_zone = "ap-south-1b"
    tags={
        Name=var.public_tag_2
    }
}

#######################################privatesubnet######################
resource"aws_subnet" "private_subnet_1"{
    vpc_id = aws_vpc.myVPC.id
    cidr_block = var.cidr_block_pr1
    map_public_ip_on_launch = false
    availability_zone = "ap-south-1a"
    tags={
        Name=var.private_sb_tag1
    }
}

resource"aws_subnet" "private_subnet_2"{
    vpc_id = aws_vpc.myVPC.id
    cidr_block = var.cidr_block_pr2
    map_public_ip_on_launch = false
    availability_zone = "ap-south-1b"
    tags={
        Name=var.private_sb_tag2
    }
}

#################################routetable#################################
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.myVPC.id
    
    route {
     cidr_block = var.destination_cidr_block
     gateway_id = aws_internet_gateway.myIGW.id
    }
        tags = {
            Name=var.public_rt_tag
        }
  
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.myVPC.id


        tags = {
            Name=var.private_rt_tag
        }
  
}
#######################################route table association##############################
resource "aws_route_table_association" "public_subnet_1_association" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.public_route_table.id
  
}
resource "aws_route_table_association" "public_subnet_2_association" {
    subnet_id = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.public_route_table.id
  
}
resource "aws_route_table_association" "private_subnet_1_association" {
    subnet_id = aws_subnet.private_subnet_1.id
    route_table_id = aws_route_table.private_route_table.id
  
}
resource "aws_route_table_association" "private_subnet_2_association" {
    subnet_id = aws_subnet.private_subnet_2.id
    route_table_id = aws_route_table.private_route_table.id
  
}

##############################################security group##################################################
resource "aws_security_group" "sg" {
    name="twc-security-group"
    vpc_id = aws_vpc.myVPC.id
        ingress {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = [var.cidr_block_security]
            description = "Allow TCP 8080"
        }
        egress {
            from_port = 0
            to_port = 0
            protocol = "-1"
            cidr_blocks = [var.cidr_block_security]
            description = "Allow all outbound traffic"
        }
        tags = {
            Name=var.security_group_tag
        }

    

}


