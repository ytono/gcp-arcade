read -p "PROJECT: " PROJECT; echo $PROJECT
read -p "ACCOUNT: " ACCOUNT; echo $ACCOUNT
if [ ${#ACCOUNT} -ne 0 ]; then
  gcloud auth application-default login ${ACCOUNT} --project ${PROJECT}
fi

read -p "ZONE: " ZONE; echo $ZONE

cat <<EOF > instance.tf
resource "google_compute_instance" "terraform" {
  project      = "${PROJECT}"
  name         = "terraform"
  machine_type = "e2-medium"
  zone         = "${ZONE}"

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
EOF

terraform apply -auto-approve
