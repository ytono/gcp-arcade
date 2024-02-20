resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  zone         = var.instance_zone
  machine_type = var.instance_type
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = var.instance_network
    access_config {
      # インスタンスに 1 対 1 で NAT IP を割り振る
    }
  }
}
