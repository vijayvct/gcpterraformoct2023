#Terraform Setting Block 
terraform {
  required_providers {
    google={
        source = "hashicorp/google"
        version = "5.0.0"
    }
  }

  backend "gcs" {
    credentials = "C:\\Demos\\GCPTerraform-Oct2023\\key.json"
    prefix = "terraform/state"
    bucket = "terraform-remote-state-bucket2023123"
  }
}

#GCP Provider Block 
provider "google" {
  credentials = file("C:\\Demos\\GCPTerraform-Oct2023\\key.json")

  project = "secure-ripple-400908"
  region = "us-central1"
  zone = "us-central1-c"
}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.myinstance.name
}


resource "google_sql_database_instance" "myinstance" {
  name             = "mydb20231812"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}

resource "google_compute_network" "mynetwork" {
    name = "terraform-testnetwork"
    auto_create_subnetworks = true
}