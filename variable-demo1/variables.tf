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

variable "vmname" {
  type = string
  default = "demo-vm"
}

variable "machinetype" {
    type = string
    default = "e2-medium"
}

variable "image" {
    type = string
    default = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "network" {
    type = string
    default = "default"
}
