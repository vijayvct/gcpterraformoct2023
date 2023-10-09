#Terraform Setting Block 
terraform {
  required_providers {
    google={
        source = "hashicorp/google"
        version = "5.0.0"
    }
  }
}

#GCP Provider Block 
provider "google" {
  credentials = file("C:\\Demos\\GCPTerraform-Oct2023\\key.json")

  project = var.projectid
  region = var.region
  zone = var.zone
}

resource "google_compute_network" "mynetwork" {
  name = var.network-name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "mysubnet" {
    name = var.subnetname
    ip_cidr_range = var.iprange
    network = google_compute_network.mynetwork.self_link
}