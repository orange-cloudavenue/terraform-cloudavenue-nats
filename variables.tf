variable "rules" {
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
  nullable = false
  description = "Nat configuration rules"
}
