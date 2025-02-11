provider "google"{
    project = "<<specify the project id >>"
    region  = "us-central1"

}
resource "google_compute_instance" "terraform-vm"{
    name         =  "terraform-vm"
    machine_type = "n2-standard-2"
    zone         = "us-central1-c"
    boot_disk {
      initialize_params {
        image = "ubuntu-os-cloud/ubuntu-2004-focal-v20220712"
      }
    }
    network_interface {
      network = "test"  # provide the vpc name 
    }
}
