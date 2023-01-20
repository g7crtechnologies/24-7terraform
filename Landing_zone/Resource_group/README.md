<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rg"></a> [rg](#module\_rg) | ../module/tfs_azurerm_rg | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | Environment | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location of rg | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | region for resources | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to all resources created. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | ------------------------------------------ Outpot for Resource Group ------------------------------------------ |
<!-- END_TF_DOCS -->