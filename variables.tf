variable "health_checks" {
  type    = any
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
