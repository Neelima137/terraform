
resource "google_service_account" "default" {
    account_id = "service-account-id"
    display_name = "service account"
  
}

resource "google_container_cluster" "tgke" {
    name = "tgke-1"
    remove_default_node_pool = true
    initial_node_count = 1
    location = "us-central1"
    deletion_protection = false
}
resource "google_container_node_pool" "name_nodepool" {
    name =  "nodepool"
    location = "us-central1"
    cluster = google_container_cluster.tgke.name
    node_count = 1

    node_config {
      machine_type = "n2-standard-2"
      preemptible = true
      service_account = google_service_account.default.email  
      oauth_scopes =["https://www.googleapis.com/auth/cloud-platform" ]   
     
    }

}
