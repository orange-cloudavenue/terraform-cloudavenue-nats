terraform {
  required_version = ">= 1.3"
  required_providers {
    cloudavenue = {
      source  = "orange-cloudavenue/cloudavenue"
      version = "~> 0.16.0"
    }
  }
}