locals {
  # Amazon 2023 Linux x86_64
  aws_ec2_ami_id        = "ami-067871d950411e643"
  aws_ec2_instance_type = "t3.medium"
}

resource "buildkite_agent_token" "buildkite_agent_token_1" {
  description = "https://circleci.atlassian.net/browse/SHIBUYA-85"
}

resource "aws_key_pair" "aws_key_pair1" {
  public_key = file("/Users/kelvin/.ssh/id_ed25519_kelvintaywl.pub")
}

resource "aws_instance" "aws_ec2_linux_x86_64" {
  ami           = local.aws_ec2_ami_id
  instance_type = local.aws_ec2_instance_type
  user_data = templatefile(
    "${path.module}/${var.user_data_script_template}",
    {
      token = buildkite_agent_token.buildkite_agent_token_1.token
      name  = var.buildkite_agent_name
      tags  = var.buildkite_agent_tags
    }
  )
  key_name        = aws_key_pair.aws_key_pair1.key_name
  security_groups = ["${aws_security_group.aws_security_group1.id}"]
  subnet_id       = aws_subnet.aws_subnet1.id
}

resource "aws_vpc" "aws_vpc1" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "aws_subnet1" {
  cidr_block        = cidrsubnet(aws_vpc.aws_vpc1.cidr_block, 3, 1)
  vpc_id            = aws_vpc.aws_vpc1.id
  availability_zone = "${var.aws_region}a"
}

resource "aws_security_group" "aws_security_group1" {
  name   = "allow-all-sg"
  vpc_id = aws_vpc.aws_vpc1.id
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
  }
  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "aws_eip1" {
  instance = aws_instance.aws_ec2_linux_x86_64.id
  vpc      = true
}

resource "aws_internet_gateway" "aws_internet_gateway1" {
  vpc_id = aws_vpc.aws_vpc1.id
}

resource "aws_route_table" "aws_route_table1" {
  vpc_id = aws_vpc.aws_vpc1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_internet_gateway1.id
  }
}
resource "aws_route_table_association" "aws_route_table_association1" {
  subnet_id      = aws_subnet.aws_subnet1.id
  route_table_id = aws_route_table.aws_route_table1.id
}