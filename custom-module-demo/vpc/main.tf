resource "google_compute_network" "terraform_network" {
    name = "${var.vpcname}-network"
    auto_create_subnetworks = "${var.auto_create_subnets}"
}

resource "google_compute_subnetwork" "subnet1" {
  name = "${var.vpcname}-${var.region}-subnet1"
  ip_cidr_range = "${var.subnet_cidr}"
  region = "${var.region}"
  network = "${google_compute_network.terraform_network.self_link}"
}