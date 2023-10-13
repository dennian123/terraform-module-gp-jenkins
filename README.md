# terraform-module-gp-jenkins

## Usage:
##Provide parameters if planning to deploy in other than Ohio Region

```hcl
module "ubuntu-jdk-jenkins" {
    source = ""
    version = "v0.0.1"
    provider_region = "us-east-2"
    vpc_cidr = "10.0.0.0/16"
    subnet1_cidr = "10.0.1.0/24"
    subnet2_cidr = "10.0.2.0/24"
    subnet3_cidr = "10.0.3.0/24"
    sub_az1 = "us-east-2a"
    sub_az2 = "us-east-2b"
    sub_az3 = "us-east-2c"
    sub_ip_on_launch = true              # type - bool
    ec2_type = "t2.micro"
    ec2_pub_ip_on_launch =  true         # type - bool
    ebs_size = 30                      # type - number
    ebs_type = "gp3"
    key_name = "my-keyyyyyyyyy"
}
```