resource "aws_route53_health_check" "this" {
  for_each = {
  for hc in var.health_checks :
  join("_", compact([
    lookup(hc, "fqdn", ""), lookup(hc, "ip_address", ""), "${hc.port}_${hc.type}", lookup(hc, "resource_path", "")
  ])) => hc
  }

  fqdn              = lookup(each.value, "fqdn", null)
  ip_address        = lookup(each.value, "ip_address", null)
  port              = lookup(each.value, "port", null)
  type              = each.value.type
  resource_path     = lookup(each.value, "resource_path", null)
  failure_threshold = lookup(each.value, "failure_threshold", null)
  request_interval  = each.value.request_interval
  tags              = var.tags
}
