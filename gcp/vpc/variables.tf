variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}
variable "project" {
  type        = string
  description = "Project ID"

}

variable "auto_subnet" {
  type        = bool
  default     = false
  description = "If you want to auto create subnet"
}

variable "subnet_name" {
  type        = string
  description = "Name of subnet"
}
variable "subnet_region" {
  type        = string
  description = "Subnet Region"
}

variable "network" {
  type        = string
  description = "ID of VPC network"
}
variable "ip_cidr_range" {
  type        = string
  description = "IP CIDR range"

}