#Provide parameters if planning to deploy in N. California Region
provider_region = "us-west-1"
vpc_cidr = "10.0.0.0/16"
subnet1_cidr = "10.0.1.0/24"
subnet2_cidr = "10.0.2.0/24"
subnet3_cidr = "10.0.3.0/24"
sub_az1 = "us-west-1a"
sub_az2 = "us-west-1b"
sub_az3 = "us-west-1c"
sub_ip_on_launch = true              # type - bool
ec2_type = "t2.micro"
ec2_pub_ip_on_launch = true          # type - bool
ebs_size = 30                       # type - number
ebs_type = "gp3"
key_name = "n.california-key"