output "health_checks" {
  value = {for k, v in aws_route53_health_check.this : k => v.id}
}
