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
  instance_zone    = "Zone"
  instance_network = google_compute_network.mynetwork.self_link
}

# mynet-eu-vm インスタンスを作成する
module "mynet-eu-vm" {
  source           = "./instance"
  instance_name    = "mynet-eu-vm"
  instance_zone    = "europe-west1-d"
  instance_network = google_compute_network.mynetwork.self_link
}
