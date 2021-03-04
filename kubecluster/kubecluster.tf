
provider "aws" {
  region = "us-east-1"
}

module "cluster_1" {
  source       = "weibeld/kubeadm/aws"
  version      = "~> 0.2"
  cluster_name = "tfflask"
}

