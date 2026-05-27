variable "acceptance_required" {
  type        = bool
  description = "Whether VPC endpoint connection requests require manual acceptance."
  default     = true
}

variable "network_load_balancer_arns" {
  type        = list(string)
  description = "List of Network Load Balancer ARNs to associate with the endpoint service."
  default     = []
}

variable "gateway_load_balancer_arns" {
  type        = list(string)
  description = "List of Gateway Load Balancer ARNs to associate with the endpoint service."
  default     = []
}

variable "private_dns_name" {
  type        = string
  description = "Private DNS name for the endpoint service."
  default     = null
}

variable "supported_ip_address_types" {
  type        = list(string)
  description = "Supported IP address types. Valid values: ipv4, ipv6."
  default     = ["ipv4"]
}
