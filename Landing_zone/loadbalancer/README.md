<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.37.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lb"></a> [lb](#module\_lb) | ../module/tfs_azurerm_lb | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lbs"></a> [lbs](#input\_lbs) | List containing your load balancers. | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location of the load balancer, use the RG's location if not set | `any` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix applied on the load balancer resources names. | `any` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU of the load balancer. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for loadbalancer | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->