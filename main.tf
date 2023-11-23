resource "cloudavenue_edgegateway_nat_rule" "nat_rule" {
  for_each = {for idx, query in var.rules: idx => query}
    name                      = each.value.name 
    edge_gateway_name         = each.value.edge_gateway_name
    rule_type                 = each.value.rule_type
    external_address          = each.value.external_address
    internal_address          = each.value.internal_address
    priority                  = each.value.priority
}
