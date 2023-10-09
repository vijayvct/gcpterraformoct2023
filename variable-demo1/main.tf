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

#Compute Engine 
resource "google_compute_instance" "my_instance" {
  name = var.vmname
  machine_type = var.machinetype
  zone = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
    access_config {
      
    }
  }
}