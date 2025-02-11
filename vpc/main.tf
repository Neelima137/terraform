provider "google"{
    project = var.project_id
    region  = var.region
}
resource "google_compute_network" "tvpc"{
    name = var.name
    auto_create_subnetworks =false 
}


resource "google_compute_subnetwork" "network-with-secondary-ip-ranges"{
    name            = "${var.name}-subnetwork"
    ip_cidr_range   = "10.0.0.0/29"
    region          = var.region
    network       = google_compute_network.tvpc.id
    secondary_ip_range {
        range_name ="secondary-range"
        ip_cidr_range   = "192.0.0.0/29"
  }
}
