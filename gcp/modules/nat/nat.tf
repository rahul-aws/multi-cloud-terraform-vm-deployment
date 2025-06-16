resource "google_compute_router" "default" {
  name    = "${var.name}-router"
  region  = var.region
  network = var.network
}

resource "google_compute_router_nat" "nat_gw" {
  name                               = "${var.name}-ngw"
  router                             = google_compute_router.default.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}