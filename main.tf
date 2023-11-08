variable "global_rules" {
  type = list(object( {
    name                      = string
    edge_gateway_id           = optional(string)
    edge_gateway_name         = optional(string)
    enabled                   = optional(bool)
    description               = optional(string)
    rule_type                 = string
    external_address          = string
    internal_address          = string
    dnat_external_port        = optional(string)
    snat_destination_address  = optional(string)
    priority                  = optional(number)
    firewall_match            = optional(string)
  }))
  nullable = true
  default = [
    # {
    #   name                  = "example-nat1"
    #   edge_gateway_name     = "myEdge"
    #   enabled               = true
    #   description           = "Add nat rule"
    #   rule_type             = "SNAT"
    #   external_address      = "89.32.25.10"
    #   internal_address      = "11.11.11.0/24"
    #   priority              = 10  
    # },
  ]
}

resource "cloudavenue_edgegateway_nat_rule" "example" {
  for_each = {for idx, query in concat(var.global_rules, var.rules): idx => query}
    name                      = each.value.name 
    edge_gateway_name         = each.value.edge_gateway_name
    rule_type                 = each.value.rule_type
    external_address          = each.value.external_address
    internal_address          = each.value.internal_address
    priority                  = each.value.priority
}
