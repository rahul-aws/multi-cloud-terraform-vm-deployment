resource "google_service_account" "custom-sa" {
  account_id   = var.account_id
  display_name = "My custom sa"
}

resource "google_compute_instance" "myvm" {
  name         = var.myvm
  machine_type = "e2-medium"
  zone         = var.zone
  tags         = var.tags
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }
  metadata = {
    enable-oslogin = "TRUE"
  }
  network_interface {
    subnetwork = var.subnetwork
  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.custom-sa.email
    scopes = ["cloud-platform"]
  }
}