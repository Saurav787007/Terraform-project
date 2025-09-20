resource "aws_instance" "myapp-server" {
    ami = var.ami_name
    instance_type = var.instance_type
    key_name = "Mumbai"
    subnet_id = aws_subnet.public_subnet_1.id
    vpc_security_group_ids = [ aws_security_group.sg.id ]
    availability_zone = var.availability_zone
    associate_public_ip_address = true
    user_data = file("jenkins-server-script.sh")

    tags = {
      Name="${var.env_prefix}-server"
    }
  
}