resource "google_compute_instance" "my-vm" {
  name = "${var.vmname}"
  machine_type = "${var.vmtype}"
  zone = "${var.zone}"

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network = "${var.vpcname}"
    subnetwork = "${var.subnet}"
    access_config {
      
    }
  }
}