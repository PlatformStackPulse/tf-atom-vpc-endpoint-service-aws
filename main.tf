resource "aws_vpc_endpoint_service" "this" {
  count = local.enabled ? 1 : 0

  acceptance_required        = var.acceptance_required
  network_load_balancer_arns = var.network_load_balancer_arns
  gateway_load_balancer_arns = var.gateway_load_balancer_arns
  private_dns_name           = var.private_dns_name
  supported_ip_address_types = var.supported_ip_address_types

  tags = module.this.tags
}
