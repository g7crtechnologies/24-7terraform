<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =3.29.1 |
| <a name="requirement_random"></a> [random](#requirement\_random) | =3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.29.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/network_security_group) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/resource_group) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.sub_nsg](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.29.1/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used by the virtual network. | <pre>map(map(object({<br>    name          = string<br>    address_space = list(string)<br>    product       = string<br>  })))</pre> | n/a | yes |
| <a name="input_component"></a> [component](#input\_component) | environment name for naming convention | `any` | n/a | yes |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Name of the resource group to be imported. | `bool` | `false` | no |
| <a name="input_existing_resource_group_name"></a> [existing\_resource\_group\_name](#input\_existing\_resource\_group\_name) | Name of the resource group to be imported. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of the vnet to create. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | pci\_type name for naming convention | `string` | n/a | yes |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | The address prefix to use for the subnet. | `any` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | n/a | `map(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
<!-- END_TF_DOCS -->