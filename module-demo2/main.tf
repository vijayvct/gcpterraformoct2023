terraform {
  required_providers {
    google={
        source = "hashicorp/google"
        version = "4.74.0"
    }
  }
}

provider "google" {
  credentials = file("C:\\Demos\\GCPTerraform-Oct2023\\key.json")

  project = "secure-ripple-400908"

  region = "us-central1"
  zone = "us-central1-c"
}

module "cloud-storage_example_simple_bucket" {
  source  = "terraform-google-modules/cloud-storage/google//examples/simple_bucket"
  version = "4.0.1"
  # insert the 1 required variable here
    project_id = "secure-ripple-400908"
}