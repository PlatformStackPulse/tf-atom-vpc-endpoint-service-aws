# -----------------------------------------------------------------------------
# Module-Specific Variables
# -----------------------------------------------------------------------------

variable "acceptance_required" {
  type        = bool
  description = "Whether VPC endpoint connection requests require acceptance."
  default     = true
}

variable "allowed_principals" {
  type        = list(string)
  description = "List of ARNs of principals allowed to discover the service."
  default     = []
}

variable "gateway_load_balancer_arns" {
  type        = list(string)
  description = "ARNs of Gateway Load Balancers for the service."
  default     = []
}

variable "network_load_balancer_arns" {
  type        = list(string)
  description = "ARNs of Network Load Balancers for the service."
  default     = []
}

variable "private_dns_name" {
  type        = string
  description = "Private DNS name for the service."
  default     = null
}

variable "supported_ip_address_types" {
  type        = list(string)
  description = "Supported IP address types. Valid values: ipv4, ipv6."
  default     = ["ipv4"]
}
