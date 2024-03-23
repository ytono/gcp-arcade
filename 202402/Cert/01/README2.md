# Arcade Hero: Enter the Storage
mkdir instance

cat <<EOF > instance/main.tf
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
EOF

cat <<EOF > instance/variables.tf
variable "instance_name" {}
variable "instance_zone" {}
variable "instance_type" {
  default = "e2-micro"
}
variable "instance_network" {}
EOF

cat <<EOF > mynetwork.tf
# mynetwork ネットワークを作成する
resource "google_compute_network" "mynetwork" {
  name = "mynetwork"
  # リソース プロパティをここに含める
  auto_create_subnetworks = "true"
}
# mynetwork で HTTP、SSH、RDP、ICMP のトラフィックを許可するファイアウォール ルールを追加する
resource "google_compute_firewall" "mynetwork-allow-http-ssh-rdp-icmp" {
  name = "mynetwork-allow-http-ssh-rdp-icmp"
  # リソース プロパティをここに含める
  network = google_compute_network.mynetwork.self_link
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["0.0.0.0/0"]
}


# mynet-us-vm インスタンスを作成する
module "mynet-us-vm" {
  source           = "./instance"
  instance_name    = "mynet-us-vm"
  instance_zone    = "us-central1-f"
  instance_network = google_compute_network.mynetwork.self_link
}

# mynet-eu-vm インスタンスを作成する
module "mynet-eu-vm" {
  source           = "./instance"
  instance_name    = "mynet-eu-vm"
  instance_zone    = "europe-west1-d"
  instance_network = google_compute_network.mynetwork.self_link
}
EOF

cat <<EOF > provider.tf
provider "google" {}
EOF

mv main.tf instance/
mv variables.tf instance/

terraform init
terraform apply -auto-approve