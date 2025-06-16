output "networkID" {
  value = google_compute_network.my_custom_vpc.id
}

output "network_name" {
  value = google_compute_network.my_custom_vpc.name

}

output "subnetwork" {
  value = google_compute_subnetwork.custom_subnet.name
}