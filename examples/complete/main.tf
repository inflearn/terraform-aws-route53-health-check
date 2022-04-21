terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.10.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-2"
}

module "health_check" {
  source = "../../"

  health_checks = [
    {
      ip_address        = "1.2.3.4"
      port              = "443"
      type              = "TCP"
      failure_threshold = "2"
      request_interval  = "30"
    }
  ]

  tags = {
    iac  = "terraform"
    temp = "true"
  }
}
