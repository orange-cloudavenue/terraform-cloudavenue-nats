# Terraform cloudavenue NAT module

This is the NAT module using cloudavenue Provider.  
Its allows you to configure the NAT configurations.

Useful links:

* [Cloud Avenue Provider documentation](https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/latest/docs)
* [Terraform Documentation](https://www.terraform.io/docs/language/index.html)


## Usage

Basic usage of this module is as follows:
```hcl
module "nat_rules" {
  source = "orange-cloudavenue/nats/cloudavenue"
  rules  = [
    {
      "name"                      = "example-dnat"
      "edge_gateway_name"         = cloudavenue_edgegateway.example.name
      "rule_type"                 = "DNAT"
      "description"               = "description DNAT example"
      "external_address"          = "89.32.25.10"
      "internal_address"          = "4.11.11.11"
      "priority"                  = 25
    },
    {
      "name"                      = "example-snat"
      "edge_gateway_name"         = cloudavenue_edgegateway.example.name
      "rule_type"                 = "SNAT"
      "description"               = "description SNAT example"
      "external_address"          = "89.32.25.10"
      "internal_address"          = "11.11.11.0/24"
      "priority"                  = 10
    }
  ]
}
```

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_cloudavenue"></a> [cloudavenue](#requirement\_cloudavenue) | ~> 0.14.0 |

## Resources

| Name | Type |
|------|------|
| [cloudavenue_edgegateway_nat_rule.nat-rule](https://registry.terraform.io/providers/orange-cloudavenue/cloudavenue/latest/docs/resources/edgegateway_nat_rule) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rules"></a> [rules](#input\_rules) | n/a | <pre>list(object( {<br>    name                      = string<br>    edge_gateway_id           = optional(string)<br>    edge_gateway_name         = optional(string)<br>    enabled                   = optional(bool)<br>    description               = optional(string)<br>    rule_type                 = string<br>    external_address          = string<br>    internal_address          = string<br>    dnat_external_port        = optional(string)<br>    snat_destination_address  = optional(string)<br>    priority                  = optional(number)<br>    firewall_match            = optional(string)<br>  }))</pre> | n/a | yes |
## Outputs

No outputs.
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->

## Contributing

This provider is open source and contributions are welcome.

If you want to contribute to this provider, please read the [contributing guidelines](CONTRIBUTING.md).

You may also report issues or feature requests on the [GitHub issue tracker](https://github.com/orange-cloudavenue/terraform-cloudavenue-nats/issues/new/choose).

You can consult a [listing of resources and datasources](cmd/listing/resource-ca.md).