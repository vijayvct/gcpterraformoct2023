output "vpcname_out" {
  value = google_compute_network.terraform_network.name
}

output "subnet_out" {
  value = google_compute_subnetwork.subnet1.name
}