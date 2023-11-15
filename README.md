# TF code base## Introduction
This is sample readme for terraform module

# TF code base## Introduction
This is sample readme for terraform module

## Usage
Basic usage of this module is as follows:
```hcl
module "nat_rules" {
  source = "."
  rules = [
    {
      "name"                      = "example-dnat"
      "edge_gateway_name"         = cloudavenue_edgegateway.example.name
      "rule_type"                 = "DNAT"
      "description"               = "description DNAT example Updated!!"
      "external_address"          = "89.32.25.10"
      "internal_address"          = "4.11.11.11"
      "priority"                  = 25
    }
  ]
}
```

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_cloudavenue"></a> [cloudavenue](#requirement\_cloudavenue) | 0.14.0 |

## Resources

| Name | Type |
|------|------|
| [cloudavenue_edgegateway_nat_rule.example](https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/0.14.0/docs/resources/edgegateway_nat_rule) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rules"></a> [rules](#input\_rules) | n/a | <pre>list(object( {<br>    name                      = string<br>    edge_gateway_id           = optional(string)<br>    edge_gateway_name         = optional(string)<br>    enabled                   = optional(bool)<br>    description               = optional(string)<br>    rule_type                 = string<br>    external_address          = string<br>    internal_address          = string<br>    dnat_external_port        = optional(string)<br>    snat_destination_address  = optional(string)<br>    priority                  = optional(number)<br>    firewall_match            = optional(string)<br>  }))</pre> | n/a | yes |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->