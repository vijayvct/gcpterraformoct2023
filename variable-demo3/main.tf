#Terraform Setting Block 
terraform {
  required_providers {
    google={
        source = "hashicorp/google"
        version = "5.0.0"
    }

    random ={
        source = "hashicorp/random"
        version = "3.5.1"
    }
  }
}

locals {
  prefix="ct"
}


#Random Provider Block
provider "random" {
  
}

#GCP Provider Block
provider "google" {
  credentials = file(var.credentials)
  project = var.projectid
  region = var.region
  zone = var.zone
}

resource "random_id" "bucketid" {
  byte_length = 8
}

resource "google_storage_bucket" "my-bucket" {
  name = "${local.prefix}-${var.bucket_name}-${random_id.bucketid.hex}"
  location = var.bucket_location
}

output "bucket-output" {
  value = google_storage_bucket.my-bucket.name
  sensitive = true
}