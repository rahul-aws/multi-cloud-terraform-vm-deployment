variable "name" {
  type        = string
  description = "Name of firewall rule"
}

variable "network" {
  type        = string
  description = "VPC"
}
variable "target_tags" {
  type        = list(string)
  description = "Target Tags"
}

variable "source_ranges" {
  type        = list(string)
  description = "IP Range of source"

}

