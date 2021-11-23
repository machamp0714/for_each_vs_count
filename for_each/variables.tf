variable "cidr_block" {
  type = string
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "public_subnets" {
  type    = map(map(string))
  default = {}
}
