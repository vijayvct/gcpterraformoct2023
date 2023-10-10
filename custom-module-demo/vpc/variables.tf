variable "vpcname" {
  type = string
  description = "Name of VPC network"
}

variable "region" {
  type = string
  description = "Name of the region"
}

variable "subnet_cidr" {
  type = string
  description = "CIDR block for subnet"
}
variable "auto_create_subnets" {
  type = bool
  description = "value for creating auto subnets"
}
