<!-- BEGIN_TF_DOCS -->
## Requirements

## **Virtual network**
This module creates the virtual network for each environment along with nsg’ s , route tables
And subnets 

       -    “Az-< Environments >” to set the subscription. 
       -	“make plan-< Environments >-eu”  to plan the terraform 
       -	“make apply-< Environments >-eu” to apply the terraform 

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | =3.4.3 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../module/tfs_azurerm_vnet | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used by the virtual network. | <pre>map(map(object({<br>    name          = string<br>    address_space = list(string)<br>    product       = string<br>  })))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location of vnets | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | pci\_type name for naming convention | `string` | n/a | yes |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | The address prefix to use for the subnet. | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app-gw"></a> [app-gw](#output\_app-gw) | n/a |
| <a name="output_firewall"></a> [firewall](#output\_firewall) | n/a |
| <a name="output_gateway"></a> [gateway](#output\_gateway) | n/a |
| <a name="output_lb"></a> [lb](#output\_lb) | n/a |
| <a name="output_mgmt"></a> [mgmt](#output\_mgmt) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | ------------------------------------------ Output of each resource ------------------------------------------ |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
<!-- END_TF_DOCS -->
