# Google Cloud Fundamentals: Getting Started with Cloud Storage and Cloud SQL
export ZONE=us-east1-d
export REGION=${ZONE%-*}

gsutil cp gs://cloud-training/gcpfci/my-excellent-blog.png .

cat <<EOF > main.tf
resource "google_compute_instance" "vm_instance" {
  boot_disk {
    auto_delete = true

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20240213"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-medium"

  metadata = {
    startup-script = "apt-get update\napt-get install apache2 php php-mysql -y\nservice apache2 restart"
  }

  name = "bloghost"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/${PROJECT_ID}/regions/${REGION}/subnetworks/default"
  }

  tags = ["http-server"]
  zone = "${ZONE}"
}

resource "google_storage_bucket" "default" {
  name          = "${DEVSHELL_PROJECT_ID}"
  location      = "ASIA"
  storage_class = "STANDARD"
  force_destroy = true
}

resource "google_storage_bucket_object" "my_excellent_blog" {
  name   = "my-excellent-blog.png"
  source = "my-excellent-blog.png"
  bucket = "${DEVSHELL_PROJECT_ID}"
}

resource "google_storage_object_acl" "my_excellent_blog_acl" {
  bucket = google_storage_bucket.default.name
  object = google_storage_bucket_object.my_excellent_blog.name
  role_entity = [
    "READER:allUsers",
  ]
}
resource "google_sql_database_instance" "default" {
  database_version    = "MYSQL_8_0_31"
  deletion_protection = true
  instance_type       = "CLOUD_SQL_INSTANCE"
  name                = "blog-db"
  region              = "${REGION}"

  settings {
    activation_policy           = "ALWAYS"
    availability_type           = "ZONAL"
    connector_enforcement       = "NOT_REQUIRED"
    deletion_protection_enabled = true
    disk_autoresize             = true
    disk_autoresize_limit       = 0
    disk_size                   = 10
    disk_type                   = "PD_SSD"
    edition                     = "ENTERPRISE"
    pricing_plan                = "PER_USE"
    tier                        = "db-custom-2-8192"
    user_labels                 = {}

    backup_configuration {
      binary_log_enabled             = true
      enabled                        = true
      location                       = "us"
      point_in_time_recovery_enabled = false
      start_time                     = "08:00"
      transaction_log_retention_days = 7

      backup_retention_settings {
        retained_backups = 7
        retention_unit   = "COUNT"
      }
    }

    insights_config {
      query_insights_enabled  = false
      query_plans_per_minute  = 0
      record_application_tags = false
      record_client_address   = false
    }

    ip_configuration {
      enable_private_path_for_google_cloud_services = false
      ipv4_enabled                                  = true
      require_ssl                                   = false
      authorized_networks {
        name  = "web front end"
        value = "\${google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip}/32"
      }
    }

    location_preference {
      zone = "${ZONE}"
    }
  }

  timeouts {}
}

resource "google_sql_user" "default" {
  name     = "blogdbuser"
  instance = google_sql_database_instance.default.name
}
EOF

cat <<EOF > provider.tf
provider "google" {}
EOF

terraform init
terraform apply -auto-approve