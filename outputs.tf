output "endpoint_service_id" {
  description = "The ID of the VPC Endpoint Service."
  value       = try(aws_vpc_endpoint_service.this[0].id, "")
}

output "endpoint_service_arn" {
  description = "The ARN of the VPC Endpoint Service."
  value       = try(aws_vpc_endpoint_service.this[0].arn, "")
}

output "service_name" {
  description = "The service name of the VPC Endpoint Service for consumers."
  value       = try(aws_vpc_endpoint_service.this[0].service_name, "")
}

output "state" {
  description = "The state of the VPC Endpoint Service."
  value       = try(aws_vpc_endpoint_service.this[0].state, "")
}

output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}
