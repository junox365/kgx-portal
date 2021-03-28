terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

# CloudBuild
resource "google_cloudbuild_trigger" "filename-trigger" {
  trigger_template {
    branch_name = "master"
    repo_name   = "github.com/junox365/kgx-portal"
  }
  filename = "cloudbuild.yaml"
}

# Firebase
resource "google_firebase_project" "default" {
  provider = google-beta
}

provider "google-beta" {
  credentials = file("kgx-portal-309010-d18d2f4e6afb.json")
  project     = "kgx-portal-309010"
  region      = "asia-northeast1"
  zone        = "asia-northeast1-b"
}

provider "google" {
  credentials = file("kgx-portal-309010-d18d2f4e6afb.json")
  project     = "kgx-portal-309010"
  region      = "asia-northeast1"
  zone        = "asia-northeast1-b"
}

resource "google_firebase_web_app" "basic" {
  provider     = google-beta
  project      = var.default_project_id
  display_name = "kgx-portal-hosting"

  depends_on = [google_firebase_project.default]
}

data "google_firebase_web_app_config" "basic" {
  provider   = google-beta
  web_app_id = google_firebase_web_app.basic.app_id
}

resource "google_storage_bucket" "default" {
  provider = google-beta
  name     = "kgx-portal-bucket"
}

resource "google_storage_bucket_object" "default" {
  provider = google-beta
  bucket   = google_storage_bucket.default.name
  name     = "firebase-config.json"

  content = jsonencode({
    appId             = google_firebase_web_app.basic.app_id
    apiKey            = data.google_firebase_web_app_config.basic.api_key
    authDomain        = data.google_firebase_web_app_config.basic.auth_domain
    databaseURL       = lookup(data.google_firebase_web_app_config.basic, "database_url", "")
    storageBucket     = lookup(data.google_firebase_web_app_config.basic, "storage_bucket", "")
    messagingSenderId = lookup(data.google_firebase_web_app_config.basic, "messaging_sender_id", "")
    measurementId     = lookup(data.google_firebase_web_app_config.basic, "measurement_id", "")
  })
}