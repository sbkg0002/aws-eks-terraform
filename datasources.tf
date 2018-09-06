data "aws_ami" "eks-worker" {
  filter {
    name   = "name"
    values = ["eks-worker-*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon
}

data "aws_security_group" "mgmt-linux" {
  tags {
    Name  = "tf-mgmt-linux-master"
    owner = "aws-team"
  }
}

data "aws_vpc" "active_vpc" {
  state = "available"

  tags {
    owner = "aws-team"
    Env   = "master"
  }
}

data "aws_subnet_ids" "trusted" {
  vpc_id = "${data.aws_vpc.active_vpc.id}"

  tags {
    owner = "aws-team"
    Zone  = "trusted"
  }
}
