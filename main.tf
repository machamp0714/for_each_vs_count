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
  region = "ap-northeast-1"

  public_subnets = {
    ap-northeast-1a = {
      cidr_block        = "10.0.64.0/24"
    }
    ap-northeast-1c = {
      cidr_block        = "10.0.65.0/24"
    }
  }
}

module "count" {
  source = "./count"

  cidr_block         = "10.0.0.0/16"
  public_blocks      = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["${local.region}a", "${local.region}c"]
}

module "for_each" {
  source = "./for_each"

  cidr_block     = "10.0.0.0/16"
  public_subnets = local.public_subnets
}
