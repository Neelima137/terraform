
resource "google_compute_instance" "vm" {
  name         = "${var.name}-true"
  count=var.istest==true?1:0
  machine_type = "e2-micro"
    zone = "us-central1-a"
    
 
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
resource "google_compute_instance" "vm2" {
  name         ="${var.name}-false"
  machine_type = "e2-micro"
    zone = "us-central1-a"
     count=var.istest==false?1:0

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
