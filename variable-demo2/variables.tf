variable "projectid" {
  type = string
  description = "project to deploy the resources"
  default = "secure-ripple-400908"
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-c"
}

variable "network-name" {
  type = string
}

variable "subnetname" {
  type = string
}

variable "iprange" {
    type = string
}