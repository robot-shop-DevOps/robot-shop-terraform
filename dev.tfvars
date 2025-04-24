env = "dev"

vpc_cidr = "10.0.0.0/16"

subnets = [
  {
    subnet_cidr   = "10.0.1.0/24"
    subnet_az     = "ap-south-1a"
    public_subnet = false
    subnet_name   = "subnet-private-dev"
  },
  {
    subnet_cidr   = "10.0.2.0/24"
    subnet_az     = "ap-south-1a"
    public_subnet = true
    subnet_name   = "subnet-public-dev"
  }
]

create_igw = true

create_rt = true

create_rt_association = true

route_table = [
  {
    vpc_id = "vpc-08f4c41057fcb0a50"
    routes = [
      {
        cidr_block = "0.0.0.0/0"
        gateway_id = "igw-01bf09ab9c0c6331a"
      }
    ]
    name = "public-subnet-dev-rt"
  }
]

route_table_association = [
  {
    route_table_id = "rtb-06addac74046b950f"
    subnet_id      = "subnet-0da50dfc626e142dc"
  }
]

sg = [
  {
    sg_name        = "Jenkins security group"
    sg_description = "Security group for Jenkins EC2 instances"
    sg_ingress = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    sg_egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    sg_vpc_id = "vpc-08f4c41057fcb0a50"
  },
  {
    sg_name        = "Kubernetes minikube security group"
    sg_description = "Security group for Kubernetes minikube EC2 instances"
    sg_ingress = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = 30000
        to_port     = 32767
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    sg_egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
    sg_vpc_id = "vpc-08f4c41057fcb0a50"
  }
]

ec2_instances = [
  {
    ec2_ami                = "ami-0e35ddab05955cf57"
    ec2_instance_type      = "t2.micro"
    ec2_subnet_id          = "subnet-0da50dfc626e142dc"
    ec2_sg                 = ["sg-0260aff0cb8970167"]
    ec2_public_ip          = true
    ec2_name               = "Jenkins server"
    create_key_pair        = true
    ec2_key_pair_name      = "Jenkins_server_key_pair"
    private_key_algo       = "RSA"
    rsa_bits               = 4096
    private_key_location   = "./modules/ec2/Jenkins_server_key_pair.pem"
    private_key_permission = "0600"
  },
  {
    ec2_ami                = "ami-0e35ddab05955cf57"
    ec2_instance_type      = "t3a.medium"
    ec2_subnet_id          = "subnet-0da50dfc626e142dc"
    ec2_sg                 = ["sg-0d6304c79e3d8b013"]
    ec2_public_ip          = true
    ec2_name               = "Kubernetes server"
    create_key_pair        = true
    ec2_key_pair_name      = "Kubernetes_server_key_pair"
    private_key_algo       = "RSA"
    rsa_bits               = 4096
    private_key_location   = "./modules/ec2/Kubernetes_server_key_pair.pem"
    private_key_permission = "0400"
  }
]

s3_bucket = [
  {
    bucket = "robot-shop-terraform-statefile"
    versioning = [
      {
        enabled = true
      }
    ]
  }
]