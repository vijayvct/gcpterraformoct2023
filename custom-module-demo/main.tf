#Terraform Setting Block 
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.0.0"
    }
  }
}

#GCP Provider Block 
provider "google" {
  
  credentials = file("C:\\Demos\\GCPTerraform-Oct2023\\key.json")

  project = "secure-ripple-400908"
  region = "us-central1"
  zone = "us-central1-c"
}

module "VPCModule" {
  source="./vpc"
  vpcname = "terraform-network"
  region = "us-central1"
  subnet_cidr = "44.1.0.0/16"
  auto_create_subnets = false
}

module "VMModule" {
  source = "./vm"
  vmname = "terraform-vm"
  vmtype = "e2-medium"
  zone = "us-central1-c"
  image = "ubuntu-os-cloud/ubuntu-2204-lts"
  vpcname = module.VPCModule.vpcname_out
  subnet = module.VPCModule.subnet_out
}