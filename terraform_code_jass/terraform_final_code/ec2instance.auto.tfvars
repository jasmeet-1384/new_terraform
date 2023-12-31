# EC2 Instance Variables
instance_type = "t2.micro"
instance_keypair = "testjasmeet"
private_instance_count = 2


# Generic Variables
aws_region = "ap-south-1"
environment = "stag"
business_divsion = "IT"

# VPC Variables
vpc_name = "myvpc"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zones = ["ap-south-1a", "ap-south-1b"]
vpc_public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_database_subnets= ["10.0.151.0/24", "10.0.152.0/24"]
vpc_create_database_subnet_group = true 
vpc_create_database_subnet_route_table = true   
vpc_enable_nat_gateway = true  
vpc_single_nat_gateway = true


# AWS Load Balancer Variables
app1_dns_name = "apps1.opsmgnt.com"
app2_dns_name = "apps2.opsmgnt.com"


# RDS Database Variables
db_name = "webappdb"
db_instance_identifier = "webappdb"
db_username = "dbadmin"
db_password = "dbpassword11"