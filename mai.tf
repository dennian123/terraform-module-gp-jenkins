provider "aws" {
  region = var.provider_region
}

resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "group-4"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "group-4-igw"
  }
}

resource "aws_subnet" "main1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1_cidr
  availability_zone = var.sub_az1
  map_public_ip_on_launch = var.sub_ip_on_launch

  tags = {
    Name = "public-sub1"
  }
}
resource "aws_subnet" "main2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2_cidr
  availability_zone = var.sub_az2
  map_public_ip_on_launch = var.sub_ip_on_launch

  tags = {
    Name = "public-sub2"
  }
}
resource "aws_subnet" "main3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet3_cidr
  availability_zone = var.sub_az3
  map_public_ip_on_launch = var.sub_ip_on_launch

  tags = {
    Name = "public-sub3"
  }
}


resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "group-4-rt"
  }
}

resource "aws_route_table_association" "a2" {
  subnet_id      = aws_subnet.main1.id
  route_table_id = aws_route_table.example.id
}
resource "aws_route_table_association" "b2" {
  subnet_id      = aws_subnet.main2.id
  route_table_id = aws_route_table.example.id
}
resource "aws_route_table_association" "c2" {
  subnet_id      = aws_subnet.main3.id
  route_table_id = aws_route_table.example.id
}



data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    # values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    # AMI name
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  depends_on = [aws_subnet.main1]
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_type
  subnet_id = aws_subnet.main1.id
  associate_public_ip_address = var.ec2_pub_ip_on_launch
  key_name = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  user_data = file("userdata.sh")
# modifying/Adding EBS storage size 30GB
# volume_type = " " -> google wich is more suitable for Jenkins
   ebs_block_device {
     device_name = "/dev/sda1"
     volume_size = var.ebs_size
     volume_type = var.ebs_type
    }
 

  tags = {
    Name = "group-4-Ubuntu-VM"
  }
}



resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")

  tags = {
    Name = "Teams"
  }
}



output ec2 {
  value = aws_instance.web.public_ip
}