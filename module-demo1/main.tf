terraform {
  required_providers {
    google={
        source = "hashicorp/google"
        version = "4.74.0"
    }
  }
}

provider "google-beta" {
  credentials =file("C:\\Demos\\GCPTerraform-Oct2023\\key.json")

  project = "secure-ripple-400908"
  region = "us-central1"
  zone = "us-central1-c"
}

module "sql-db_example_mysql-public" {
  source  = "GoogleCloudPlatform/sql-db/google//examples/mysql-public"
  version = "16.1.0"
  # insert the 1 required variable here
  project_id="secure-ripple-400908"
  
}