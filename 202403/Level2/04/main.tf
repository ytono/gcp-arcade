provider "google" {
  project     = "qwiklabs-gcp-00-966445ca0176"
  region      = "us-east4"
}

resource "google_storage_bucket" "test-bucket-for-state" {
  name        = "qwiklabs-gcp-00-966445ca0176"
  location    = "US"
  uniform_bucket_level_access = true
}

terraform {
  backend "gcs" {
    bucket  = "qwiklabs-gcp-00-966445ca0176"
    prefix  = "terraform/state"
  }
}
