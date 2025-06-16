resource "google_compute_network" "my_custom_vpc" {
  name                    = var.vpc_name
  project                 = var.project
  auto_create_subnetworks = var.auto_subnet
}