variable provider_region {
    type = string
    default = "us-east-1"   
    description = "Enter aws provider region"
}

variable vpc_cidr {
    type = string
    default = "10.0.0.0/16"
    description = "Enter cider_block for your VPC"
}

# subnet variables:
variable subnet1_cidr {
    type = string
    default = "10.0.1.0/24"
    description = "Enter cider_block for subnet-1"
}
variable subnet2_cidr {
    type = string
    default = "10.0.2.0/24"
    description = "Enter cider_block for subnet-2"
}
variable subnet3_cidr {
    type = string
    default = "10.0.3.0/24"
    description = "Enter cider_block for subnet-3"
}


variable sub_az1 {
    type = string
    default = "us-east-1a"
    description = "Enter az"
}
variable sub_az2 {
    type = string
    default = "us-east-1b"
    description = "Enter az"
}
variable sub_az3 {
    type = string
    default = "us-east-1c"
    description = "Enter az"
}

variable  sub_ip_on_launch {
    type = bool
    default = true
    description = "Enter true/false for enabling/disabling public ip on launch on subnet level"
}


# aws instance variables:
variable ec2_type {
    type = string
    default = "t2.micro"
    description = "Enter desired instance type"
}

variable ec2_pub_ip_on_launch {
    type = bool
    default = true
    description = "Enter true/false for assigning public IPv4 for ec2 instance " 
}

variable ebs_size {
    type = number
    default = 8
    description = "Enter desired volume EBS volume. EX: 150"
}
variable ebs_type {
    type = string
    default = "gp3"
    description = "Enter desired EBS type"
}


# key variables:
variable key_name {
    type = string 
    default = "deployer-key"
    description = "Enter desired key name"
}