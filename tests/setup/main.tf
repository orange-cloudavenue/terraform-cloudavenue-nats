terraform {
  required_providers {
    cloudavenue = {
      source  = "orange-cloudavenue/cloudavenue"
      version = "~> 0.14.0"
    }
  }
}

provider "cloudavenue" {
  org      = "my_org"
  user     = "my_user"
  password = "my_password"
}

data "cloudavenue_tier0_vrfs" "example" {}

resource "cloudavenue_vdc" "example" {
  name                  = "ModuleTF-abcdef"
  description           = "ModuleTF"
  cpu_allocated         = 22000
  memory_allocated      = 30
  cpu_speed_in_mhz      = 2200
  billing_model         = "PAYG"
  disponibility_class   = "ONE-ROOM"
  service_class         = "STD"
  storage_billing_model = "PAYG"

  storage_profiles = [
    {
      class   = "gold"
      default = true
      limit   = 500
    }
  ]
}

resource "cloudavenue_edgegateway" "example" {
  owner_name     = cloudavenue_vdc.example.name
  tier0_vrf_name = data.cloudavenue_tier0_vrfs.example.names.0
  owner_type     = "vdc"
  bandwidth      = 25
}

module "nat_rules" {
  source = "./../.."
  rules = [
    {
      "name"                      = "example-dnat"
      "edge_gateway_name"         = cloudavenue_edgegateway.example.name
      "rule_type"                 = "DNAT"
      "description"               = "description DNAT example"
      "external_address"          = "89.32.25.10"
      "internal_address"          = "4.11.11.11"
      "priority"                  = 25
    }
  ]
}
