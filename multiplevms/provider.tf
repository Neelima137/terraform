terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.22.0"
    }
  }
}
provider "google" {
  region  = "us-central1"
  project = ""
