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

  project = "secure-ripple-400908"
  region = "us-central1"
  zone = "us-central1-c"
}

#GCP network resource
resource "google_compute_network" "my_network" {
  name="terrform-network"
  auto_create_subnetworks = false
}

#Subnet to the network 
resource "google_compute_subnetwork" "terraform-subnet-1" {
  name="terraform-subnet-us-central1"
  ip_cidr_range = "44.2.0.0/16"
  region = "us-central1"
  network = google_compute_network.my_network.id
}

resource "google_compute_subnetwork" "terraform-subnet-2" {
  name="terraform-subnet-us-east1"
  ip_cidr_range = "55.2.0.0/16"
  region = "us-east1"
  network = google_compute_network.my_network.id
}

#Compute Engine instance 
resource "google_compute_instance" "my_instance" {
  name="terraform-instance"
  machine_type = "e2-medium"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
      image ="ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  network_interface {
    network = google_compute_network.my_network.self_link
    subnetwork = google_compute_subnetwork.terraform-subnet-1.self_link
    access_config {
      
    }
  }

  provisioner "local-exec" {
  
    command = "echo Machine created >> ip_address.txt"
  }


  provisioner "remote-exec" {
    inline = [ 
        "sudo apt-get update",
        "sudo apt install nginx -y"
     ]
  }
}