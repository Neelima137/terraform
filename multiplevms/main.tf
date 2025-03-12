resource "google_compute_instance" "default" {
  name         = var.vmname[count.index]
  machine_type = "e2-micro"
    zone = "us-central1-a"
    count = 4
 
boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      labels = {
        my_label = "value"
      }
    }
  }
 

  network_interface {
    network = "pipeline-vpc"

    }
}
