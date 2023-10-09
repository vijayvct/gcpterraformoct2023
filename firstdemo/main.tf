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
  
  credentials = file("key.json")

  project = "secure-ripple-400908"
  region = "us-central1"
  zone = "us-central1-c"
}

#Resource Block 
#GCP Network Resource 
# resource "google_compute_network" "my_network" {
#   name="terraform-network"
#   auto_create_subnetworks = true
# }

resource "google_compute_network" "my_network" {
  name="terraform-network"
  auto_create_subnetworks = false
}