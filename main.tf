terraform {
  required_providers {
    aws = {
      source  = "aws"
      version = "= 3.66.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

locals {
  availability_zone = "ap-northeast-1"

  public_subnets = {
    "public_subnet_1a" = {
      cidr_block        = "10.0.64.0/24"
      availability_zone = "ap-northeast-1a"
    }
    "public_subnet_1c" = {
      cidr_block        = "10.0.65.0/24"
      availability_zone = "ap-northeast-1c"
    }
  }
}

module "count" {
  source = "./count"

  cidr_block         = "10.0.0.0/16"
  public_blocks      = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["${local.availability_zone}a", "${local.availability_zone}c"]
}
