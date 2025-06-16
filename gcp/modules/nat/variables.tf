variable "name" {
  type        = string
  description = "Name"

}
variable "region" {
  type    = string
  default = "us-central1"
}
variable "network" {
  type    = string
  default = "VPC"
}