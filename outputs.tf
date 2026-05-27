output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}

output "id" {
  description = "The ID of the VPC endpoint service."
  value       = try(aws_vpc_endpoint_service.default[0].id, "")
}

output "arn" {
  description = "The ARN of the VPC endpoint service."
  value       = try(aws_vpc_endpoint_service.default[0].arn, "")
}

output "service_name" {
  description = "The service name for consumers."
  value       = try(aws_vpc_endpoint_service.default[0].service_name, "")
}

output "state" {
  description = "The state of the VPC endpoint service."
  value       = try(aws_vpc_endpoint_service.default[0].state, "")
}
