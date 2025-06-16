resource "google_compute_firewall" "custom-firewall" {
  name    = var.name
  network = var.network
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags   = var.target_tags
  source_ranges = var.source_ranges

}