resource "google_compute_subnetwork" "custom_subnet" {
  name          = var.subnet_name
  region        = var.subnet_region
  network       = var.network
  ip_cidr_range = var.ip_cidr_range
  depends_on    = [google_compute_network.my_custom_vpc]


}