locals {
  config_data = yamldecode(file("./config.yaml"))
}
module "vpc" {
  source        = "./modules/vpc"
  vpc_name      = local.config_data.vpc.vpc_name
  project       = local.config_data.project
  auto_subnet   = local.config_data.vpc.auto_subnet
  subnet_name   = local.config_data.subnet.name
  subnet_region = local.config_data.subnet.region
  ip_cidr_range = local.config_data.subnet.ip_cidr_range
  network       = local.config_data.subnet.network

}

module "vm" {
  source     = "./modules/vm"
  account_id = local.config_data.vm.account_id
  myvm       = local.config_data.vm.name
  zone       = local.config_data.vm.zone
  tags       = local.config_data.vm.tags
  subnetwork = module.vpc.subnetwork

}

module "firewall" {
  source        = "./modules/firewalls"
  name          = local.config_data.firewall.name
  network       = module.vpc.network_name
  target_tags   = local.config_data.vm.tags
  source_ranges = local.config_data.firewall.source_ranges

}

module "ngw" {
  source  = "./modules/nat"
  name    = local.config_data.nat.name
  network = module.vpc.network_name

}
