#Terraform Setting Block to use Terraform Cloud
terraform {
  cloud {
    organization = "VijayTestOrganization"

    workspaces {
      name = "TerraformCloudTest"
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

#Resource block for Storage Bucket
resource "google_storage_bucket" "mybucket" {
  name = "terraform-demo-bucket23023101"
  location = "US"
}


#GCP network resource
resource "google_compute_network" "my_network" {
  name="terrform-network1"
  auto_create_subnetworks = false
}

#Subnet to the network 
resource "google_compute_subnetwork" "terraform-subnet-1" {
  name="terraform-subnet-us-central11"
  ip_cidr_range = "44.2.0.0/16"
  region = "us-central1"
  network = google_compute_network.my_network.id
}

resource "google_compute_subnetwork" "terraform-subnet-2" {
  name="terraform-subnet-us-east11"
  ip_cidr_range = "55.2.0.0/16"
  region = "us-east1"
  network = google_compute_network.my_network.id
}

#Compute Engine instance 
resource "google_compute_instance" "my_instance" {
  name="terraform-instance11"
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
}