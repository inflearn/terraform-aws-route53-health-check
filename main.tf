resource "aws_route53_health_check" "this" {
  for_each = {
  for hc in var.health_checks :
  join("_", compact([
    try(hc.fqdn, ""), try(hc.ip_address, ""), "${hc.port}_${hc.type}", try(hc.resource_path, "")
  ])) => hc
  }

  fqdn              = try(each.value.fqdn, null)
  ip_address        = try(each.value.ip_address, null)
  port              = try(each.value.port, null)
  type              = each.value.type
  resource_path     = try(each.value.resource_path, null)
  failure_threshold = try(each.value.failure_threshold, null)
  request_interval  = each.value.request_interval
  tags              = var.tags
}
