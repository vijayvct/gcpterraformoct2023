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

resource "google_compute_network" "my_network" {
  name="terraform-network"
  auto_create_subnetworks = false

  provisioner "local-exec" {
    command = "echo 'network created'>>confirmation.txt"
  }
}