variable "account_id" {
  type        = string
  description = "Name of SA"

}

variable "myvm" {
  type        = string
  description = "Name of vm"
}

variable "zone" {
  type        = string
  description = "Zone of the vm"
}

variable "tags" {
  type        = list(string)
  description = "tags"

}

variable "subnetwork" {
  type        = string
  description = "Network"
}
