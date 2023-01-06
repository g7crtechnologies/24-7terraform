<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_peering"></a> [peering](#module\_peering) | ../peering | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_peering_name_destination"></a> [peering\_name\_destination](#input\_peering\_name\_destination) | name of  peering in subscription b | `string` | `"destination_to_source"` | no |
| <a name="input_peering_name_source"></a> [peering\_name\_source](#input\_peering\_name\_source) | name of  peering in  subscription a | `string` | `"source_to_destination"` | no |
| <a name="input_rg_sub_destination"></a> [rg\_sub\_destination](#input\_rg\_sub\_destination) | Name of the resource group. | `string` | `"RG-Anshu-01"` | no |
| <a name="input_rg_sub_source"></a> [rg\_sub\_source](#input\_rg\_sub\_source) | Name of the resource group. | `string` | `"Data"` | no |
| <a name="input_vnet_name_sub_destination"></a> [vnet\_name\_sub\_destination](#input\_vnet\_name\_sub\_destination) | Name of Virtual Network | `string` | `"Demo"` | no |
| <a name="input_vnet_name_sub_source"></a> [vnet\_name\_sub\_source](#input\_vnet\_name\_sub\_source) | Name of Virtual Network | `string` | `"Demo"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->