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
  credentials = file("authkey.json")

  project = "poetic-hexagon-401510"
  region = "us-central1"
  zone = "us-central1-c"
}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
}

# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "instance" {
  name             = "my-db-20231812"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}