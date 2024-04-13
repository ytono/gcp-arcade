resource "google_compute_instance" "terraform" {
  project      = "qwiklabs-gcp-02-4fcb79d4538a"
  name         = "terraform"
  machine_type = "e2-medium"
  zone         = "us-east1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
